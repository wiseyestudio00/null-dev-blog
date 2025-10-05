---
title: "Lily Fantasia / Demo Update 2025-10-05"
date: 2025-10-05 16:00:00 +0800
author: null_id
categories: []
tag: []
media_subpath: /assets/posts/demo-update-2025-10-05/
CJKmainfont: Hiragino Sans GB
---

## What have you been doing?
I apologize for the lack of updates for the last few months. I have just been really locked in finishing up the Visual Novels and working on some animations.

However, being "locked in" does not excuse me from the lack of update. I really do apologize. I have realized that I am a terrible Project Manager, and I am trying to regain control of my life and work. I will try to keep up the updates as frequent as promised.

## Tokyo Game Show
Before we talk about game development, let's get distracted one last time. As you know, I had recently gone to Tokyo Game Show in September. I have been attending a lot of expos since I started working on Lily Fantasia, but this was the first time I have gone to TGS. I want to share some photos with you.

![tgs 1](tgs_1.jpg)

![tgs 2](tgs_2.jpg)

![tgs 3](tgs_3.jpg)

I was amazed by how large Tokyo Game Show is. If I were to rough estimate its size, I would say it's about 4 times the size of Taipei Game Show. I felt overwhelmed by the energy and the scale of it. If everything comes together, I definitely want to go again next year with a full booth!

## Game Content Update Plan
Good news: as of last month, all the stories (text) and visual novels have been written and put into the internal build of Lily Fantasia!

However, although the story itself wouldn't change, I still need to work on some editing to make the story flow better. We have problems with the prologue(s) in particular, where the story's pacing needs some rework. Other than that (and besides some arts I am still waiting for), the contents of Lily Fantasia is about finalized and done.

However, there are still a lot of potential polishings left on the table. I want to get one final demo update out to present the game "in its best state."

## Demo Update Plan

As you may know, there is another Expo named G-Eight that will take place in Taiwan around the end of November. I would have to officially update the Demo before it takes place.

In general, the gameplay loop won't change. However, there will be a lot of incremental improvements on the game's aesthetics, animations, and all in all "quality." The goals are:

- Gameplay aesthetic improvements (Stage, aka the piano part)
- General UI improvements, which includes aesthetic changes and more sfx (especially in Visual Novel and Loading Screen)
- Deflect animation update (aka the fight against the Wolf, his animations will require a lot of updates to be on par of the quality of later songs)
- Visual Novel improvements (camera, parallax animations)
- Achievement System
- Profile Picture System (which will be an extension of the Achievement System, where you will be able to equip the Icon of the Achievements you have unlocked)
- Leaderboard for each song (implemented with Steam's backend)
- Just in general, improve the "VIBES" of Lily Fantasia more while maintaining its paper/acoustic aesthetics.

I have finished most of the works mentioned above. However, since this is a dev-blog, I will go into details with each improvements for weeks to come. This week, I want to focus on updating the Stage and its aesthetics.


## Stage Aesthetic Update

![old gameplay](old_gameplay.png)

The problem I have with this look is mainly on the piano, especially how the dots on the background can be seen through the semi-transparent trails.

![old gameplay close look](old_gameplay_closeloook.png)

It looks dirty and makes the whole screen seemed "blurred" together, when the trails should have popped out as the focus.

One way to solve this problem is to apply an inverse mask effect on the trails, so the dots underneath the trails will be hidden......somehow.

![inverse mask concept](inverse_mask_concept.png)
^ Concept, the dots won't be shown when they are underneath the trails.

I have had this idea for a long time now, but I did not know how to create this effect. However, now I am more familiar with Shader/Shader Graph, I realized all I need to do is just making a shader that generates a rectangle that is exactly the same size and position of the Stage, and hides itself according to the rectangle.

![inverse mask shader graph](inverse_mask_shadergraph.png)

I would love to tell you what's going on, but I don't know either + it's too much math to be talked through by words only. Just know this does exactly what the concept wants us to do.

![new gameplay](new_gameplay.png)

Applying the shader to the dots & changing its texture to an more elegant grid design, this is what we ended up with. See how the patterns don't appear underneath the stage anymore so it looks so much clearer & better (in my opinion)!

## Visual Novel UI updates

The Stage's updates are not finished yet. Another big problem I have with it is how much texts are displayed. I will fix them next week. Now let's see what UI improvements I have done for the Visual Novel.

### Textbox

Before, the textbox's buttons were not localized, the icons were reused, and the sfx were ordered wrongly.

![old vn textbox](old_vn_textbox.png)

I have now added localization for each button, update the icon (Skip button now uses the Coda symbol, which means "to skip to the target section" in music sheet symbols), and sfx have been fixed. I have also added a stylized English name of the character behind their localized name tag.

![new vn textbox](new_vn_textbox.png)


### Status Display

In the Visual Novel, the player can choose to Auto/Fast Forward the dialogues. Th UI used to just display the status as plain texts, really ugly.

![old vn auto](old_vn_auto.png)

I have chosen the appropriate music sheet symbols to represent the status.

![new vn auto](new_vn_auto.png)

![new vn fast](new_vn_fast.png)

### Logs

I have also updated the Logs display. The old one doesn't really have anything wrong with it. It just doesn't look clean, and it's not clear how to exist the menu.

![old vn logs](old_vn_logs.png)

I added a control display, and also updated the background patterns to make it overall "cleaner."

![new vn logs](new_vn_logs.png)

I hope you like these changes. I worked hard to make sure with each changes, the original "paper/acoustic" aesthetics is maintained at all times, if not make it even better than what it is now.

# Conclusion
I know these changes may seem insignificant, but I believe in the details and user-experience can make or break the game. It is what separates good games from great games. I will continue to look for new ways to improve the game and do my best to act on them (with considerations on how important they may impact the gameplay experience.)

Next week, I will talk about implementing the Achievement System and Profile Picture System.