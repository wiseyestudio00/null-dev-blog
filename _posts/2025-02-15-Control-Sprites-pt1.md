---
title: "Lily Fantasia / Control Sprites, pt. 1"
date: 2025-02-15 19:00:00 +0800
author: null_id
categories: [miscellaneous]
tag: [lilyfantasia]
media_subpath: /assets/posts/control-sprites-part-1/
---

# Introduction
I recently watched very episdoes of skibiki toilet (all 77 episodes of them), and they are so good! I can't wait to see waht will come next. Really excited to see where the series will go. Bravo to the creator!

# Control Sprites
Alright, I don't really know what these all called. By control sprites, I mean those images that represents a button on the keyboard / gamepad. We display them everywhere in Lily Fantasia so players know for sure which buttons to press, regardless if they are familiar with video games before.

![SongPackSelection](SongPackSelection.png)

You may think it's easy to make because it's standard. However, it turns out if you want to support *ALL* kinds of controllers, haha, it turns out to be, haha, quite hard!

Since it's everywhere in all kinds of video games, you would think Unity has a built-in way to display those sprites (Sprites are what we called "Images" in video games development, because it sounds cooler).  Maybe it would even come with standard textures for all kinds of controllers? 

Turns out no lmao why would you think that Unity is here to mess with you not to help you. You have to do it yourself.

Fortunately, there still exist better people than me who are willing to help the world out. Here's a [pack](https://thoseawesomeguys.com/prompts/) that has all the sprites for all kinds of controllers that you can ever hope to support, licenced CC0. Incredible!

I used the pack above for Xbox gamepad, PlayStation gamepad, and Keyboard & Mouse. However, I feel like the Switch sprites aren't a good fit for the style of Nintendo Switch, pluse it doesn't have sprites for Switch Pro Controller, so I used another [pack](https://zacksly.itch.io/switch-button-icons-and-controls), which is much flatter and vector. This one is CC3 though, so I will need to credit the creator in the Special Thank list (I will also credit the creator of the pack above. That said, I haven't made the special thanks list, huh? Maybe I should make it in game now.)

You may think since we have the textures, all problems solved. However, in order to display them in-between-text, you will need to make a sprite sheets, aka, something like this:

![Joycon Sprite Sheet](joycon_sprite_sheet.png)

First of all, it turns out the sizes that of the textures that come with the pack aren't a good fit for in-line sprites, so I need to manually adjust them, one by one. Then I have to tag them one by one with with the correct name so the game (specifically the system I wrote) knows which one to display. That's over 200 unique buttons to reize and tag by name. It was maddening. I haven't recovered since.

# Format Scene
In game, there is an empty scene that I play around with specifically to see if the sprites are behaving correctly. Where's it, the Format Scene.

![Format Scene](FormatScene.png)

They look mostly right now. However, there is one thing that has been bothering me since a year ago. Do you know what it is?

It's the Switch Joycon Sprites. Their white and flat design blend into the background, esepcially when the background is also bright. You can barely seen them.

![No Shadow](Swith_No_Shadow.png)

I have been thinking that I should apply a tasteful shadow to them, so they can stand out. So I finally did! Just now.

![Before](Before.png)
^ Before

![After](After.png)
^ After

......I can't help but notice somehow the sprites are a bit off-center. Well, I will fix them after because I haven't eaten anything since I wake up and it's 5pm so like bye.

# In the next episode
KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK