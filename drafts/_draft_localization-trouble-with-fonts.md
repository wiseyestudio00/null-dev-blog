---
title: "Trouble with Fonts"
date: 2025-01-13
---

# Font
We love special fonts, right? Using the right font can bring so much _sauce_ to the game.....that is until you start doing localization.

# Cool Fonts' got big issues
- Different fonts have different sizes. Sometimes the difference is large enough that localized texts can't fit in the same place.
- Different fonts use different materials for special effects. To have the same effect for all fonts, I will need create material for each fonts, and dynamically load-in the fonts and swap the materials during runtime......very hard to do once you have a lot of texts.
- A lot of fonts are only available in English, and it's hard to find similiar fonts in other languages.
- Some fonts are too cool and artsy for players to read clearly (Sometimes it's okay, if you generally want to avoid using complex font for commonu usages such as subtitles).
- ...and a lot more!

If you are a millennias...First of all, congratulations on not being able to purchace your own house for the rest of your life, but you may also remember AAA games from the 2000s~2010s using cool fonts for their subtitles, but start using souless ugly standard fonts recently, it's probably because of the reasons above (I think? I actually don't have any hard evidence, just my guesses).

You may think these are no big deal and you will be able to manage it. But consider this: you may start with English, and then move on to other languages with lots of speakers, then you move on to languages you are not familiar with... With each language, you will need to find new fonts for each language, check their license, make sure they have all the characters you need to support... And with each updates, you will need to make sure those fonts work with the new texts......

It will become impossible to test and QA over, especially you are a small studio. It's much more easier and managable if you can at least know the game will look similiar to the default language you see during development.

For Lily Fantasia, I am using 5 fonts: Noto Serif (500 Medium, 600 SemiBold, 700 Bold) and Noto Sans (400 Serif, 700 Bold). They are both very standard fonts that are clear to read for most players, and I know they support A LOT of languages so it would just be a drag and drop for me if I need to support other languages in the future.

I do make one exception to use other fonts, that is the text in the Rating Animation. Since I know for sure I am going to display the same texts (Pefect, Great, Good...etc), I can use cool fonts for those. I may consider allowing the players to choose what font they want to use for those animation just for the funnies in the fure.

# But I still want to use cool fonts...!
I would consider using cool fonts for the following situations:

- You are just doing a small game-jam style game and you want a quick and easy way to add some sauces to your game.
- You are building a quick prototype for pitching / demo to show case what your game can fee like.
- You know for sure someone else would take care of localization issues for you.
- You don't care about localization and just want to support one language / making one version of the game as cool as possible.