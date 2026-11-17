# frozen_string_literal: true
#
# Table of contents: every heading level
#
# Chirpy builds a post's table of contents (the sidebar on wide screens, the
# "Contents" popup on narrow ones) with tocbot, set up inside its compiled
# assets/js/dist/post.min.js to list only h2-h4, and in the sidebar to fold
# h3/h4 away until you scroll into their section. Posts here use `#` (h1) for
# their top-level sections, so those were missing.
#
# After every build this rewrites the output's copy of post.min.js so the TOC
# lists h1-h6, all unfolded. The post's title is an h1 too, but it carries
# data-toc-skip and sits outside the post body, so it stays out.
#
# Works together with:
#   _includes/toc-status.html   turns the TOC on for any heading level
#                               (Chirpy only looks for h2/h3)
#   _includes/js-selector.html  loads tocbot whenever the TOC is on
#   _includes/metadata-hook.html  makes h1/h5/h6 land where tocbot highlights
#                               them when clicked, and indents H5/H6 in the popup

module TocAllHeadings
  SCRIPT = "assets/js/dist/post.min.js"
  THEME_SELECTOR = 'headingSelector:"h2, h3, h4"'
  SELECTOR = 'headingSelector:"h1, h2, h3, h4, h5, h6"'
  # How many heading levels stay unfolded: 6 is all of them.
  COLLAPSE_DEPTH = "collapseDepth:6"

  def self.patch(site)
    path = site.in_dest_dir(SCRIPT)
    return unless File.exist?(path)

    # Binary, so nothing gets re-encoded and Windows doesn't turn \n into \r\n.
    js = File.binread(path)

    # Already done: `jekyll serve` only copies the file again when it changes.
    return if js.include?(SELECTOR)

    unless js.include?(THEME_SELECTOR)
      Jekyll.logger.warn "TOC:", "#{SCRIPT} no longer contains #{THEME_SELECTOR}, " \
        "so the TOC is back to Chirpy's own setup. Update _plugins/toc-all-headings.rb " \
        "for this version of the theme."
      return
    end

    # Drop Chirpy's own collapse depth (the popup sets one), then give both the
    # sidebar and the popup every heading level, unfolded.
    js = js.gsub(/,collapseDepth:\d+/, "")
           .gsub(THEME_SELECTOR, "#{SELECTOR},#{COLLAPSE_DEPTH}")
    File.binwrite(path, js)
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  TocAllHeadings.patch(site)
end
