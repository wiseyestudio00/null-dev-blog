# frozen_string_literal: true
#
# Post translations
#
# The original of every post lives in _posts/. A translation lives in
# _translations/<language>/ under the SAME filename as its original:
#
#   _posts/2025-10-18-demo-update-20251018.md               English original
#   _translations/zh-TW/2025-10-18-demo-update-20251018.md  Traditional Chinese
#   _translations/ja-JP/2025-10-18-demo-update-20251018.md  Japanese
#
# Translations are their own collection, so they get pages but never appear in
# Chirpy's lists (home, archives, tags, feed and search all read `site.posts`).
# Their `lang` and URL come from the `defaults` in _config.yml.
#
# This plugin:
#   1. copies every front matter key a translation doesn't set itself from its
#      original (date, tags, categories, media_subpath, image...), so a
#      translation only needs `title:`;
#   2. stops the build when a translation has no original or an unknown language;
#   3. points a translation's Older/Newer buttons at its original's neighbours,
#      in the same language when those are translated too;
#   4. gives the original and its translations `page.translations` (used by
#      _includes/metadata-hook.html) and puts the language switcher above the
#      post body.

require "cgi"

module PostTranslations
  # Front matter that belongs to one file, URL or language, so it's never copied over.
  OWN_KEYS = %w(
    lang permalink layout slug ext excerpt description published draft
    last_modified_at redirect_from redirect_to translations
  ).freeze

  # Where the switcher goes: right before the post body in Chirpy's post layout.
  CONTENT_MARKER = '<div class="content">'

  class << self
    # Original post => its translations. Rebuilt on every build.
    attr_accessor :groups

    def link(site)
      self.groups = {}.compare_by_identity
      collection = site.collections["translations"]
      return unless collection

      # Case-insensitive, because Windows and macOS file names are: git can hold a
      # different case than the file on disk, and CI builds from git.
      originals = site.posts.docs.to_h { |post| [post.basename_without_ext.downcase, post] }

      collection.docs.each do |doc|
        original = originals[doc.basename_without_ext.downcase]
        unless original
          raise Jekyll::Errors::FatalException,
                "Translation #{doc.relative_path} has no original: there is no post named " \
                "#{doc.basename_without_ext} in _posts/. Give it the same filename as the post " \
                "it translates (or start its name with _ to leave it unpublished)."
        end

        lang = doc.data["lang"]
        unless languages(site).key?(lang)
          raise Jekyll::Errors::FatalException,
                "Translation #{doc.relative_path} has language #{lang.inspect}, which is not " \
                "listed under `languages` in _config.yml, or its folder has no `defaults` entry there."
        end

        inherit(doc, original)
        (groups[original] ||= []) << doc
      end

      groups.each do |original, translations|
        translations.each { |doc| link_neighbours(doc, original) }
      end
    end

    # Runs once URLs are final.
    def list_versions(site)
      order = languages(site).keys
      groups.each do |original, translations|
        versions = [original, *translations].sort_by do |doc|
          order.index(language_of(doc)) || order.size
        end
        list = versions.map do |doc|
          lang = language_of(doc)
          {
            "lang"  => lang,
            "name"  => languages(site).dig(lang, "name") || lang,
            "url"   => doc.url,
            "title" => doc.data["title"],
          }
        end
        versions.each { |doc| doc.data["translations"] = list }
      end
    end

    def add_switcher(doc)
      return unless doc.data["translations"] && doc.output

      html = switcher_html(doc)
      return if doc.output.sub!(CONTENT_MARKER) { html + CONTENT_MARKER }

      Jekyll.logger.warn "Translations:",
                         "#{doc.relative_path} has no #{CONTENT_MARKER}, so no language switcher."
    end

    private

    def languages(site)
      site.config["languages"] || {}
    end

    def language_of(doc)
      doc.data["lang"] || doc.site.config["lang"]
    end

    def inherit(doc, original)
      own = own_front_matter_keys(doc)
      original.data.each do |key, value|
        doc.data[key] = value unless OWN_KEYS.include?(key) || own.include?(key)
      end
    end

    # Keys written in the file itself, as opposed to ones filled in by `defaults`
    # or by Jekyll (a title made from the filename, empty tags...).
    def own_front_matter_keys(doc)
      content = File.read(doc.path, **Jekyll::Utils.merged_file_read_opts(doc.site, {}))
      match = Jekyll::Document::YAML_FRONT_MATTER_REGEXP.match(content)
      match ? (SafeYAML.load(match[1]) || {}).keys : []
    end

    # Jekyll links a page's Older/Newer buttons to its neighbours in its own
    # collection, which for a translation would be other translations.
    def link_neighbours(doc, original)
      lang = doc.data["lang"]
      in_lang = lambda do |post|
        next unless post

        groups.fetch(post, []).find { |t| t.data["lang"] == lang } || post
      end
      doc.define_singleton_method(:previous_doc) { in_lang.call(original.previous_doc) }
      doc.define_singleton_method(:next_doc) { in_lang.call(original.next_doc) }
    end

    def switcher_html(doc)
      current = language_of(doc)
      items = doc.data["translations"].map do |version|
        lang = version["lang"]
        name = CGI.escapeHTML(version["name"].to_s)
        if lang == current
          %(<span class="post-tag active" lang="#{lang}" aria-current="page">#{name}</span>)
        else
          href = "#{doc.site.baseurl}#{version["url"]}"
          %(<a class="post-tag" href="#{href}" hreflang="#{lang}" lang="#{lang}" ) +
            %(data-lang="#{lang}">#{name}</a>)
        end
      end
      %(<nav class="lang-switch" aria-label="Language">) +
        %(<i class="fas fa-language fa-fw" aria-hidden="true"></i>#{items.join}</nav>)
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  PostTranslations.link(site)
end

Jekyll::Hooks.register :site, :pre_render do |site|
  PostTranslations.list_versions(site)
end

Jekyll::Hooks.register [:posts, :translations], :post_render do |doc|
  PostTranslations.add_switcher(doc)
end
