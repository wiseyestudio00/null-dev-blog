---
title: "Lily Fantasia / Demo Update 2025-10-05"
date: 2025-10-05 16:00:00 +0800
author: null_id
categories: []
tag: []
media_subpath: /assets/posts/demo-update-2025-10-05/
CJKmainfont: Hiragino Sans GB
---

# What have you been doing?
I apologize for the lack of updates for the last few months. I have just been really locked in finishing up the Visual Novels and working on some animations.

However, being "locked in" does not excuse me from the lack of update. I really do apologize. I have realized that I am a terrible Project Manager, and I am trying to regain control of my life and work. I will try to keep up the updates as frequent as promised.

# Tokyo Game Show
Before we talk about game development, let's get distracted one last time. As you know, I had recently gone to Tokyo Game Show in September. I have been attending a lot of expos since I started working on Lily Fantasia, but this was the first time I have gone to TGS. I want to share some photos with you.

![tgs 1](tgs_1.jpg)

![tgs 2](tgs_2.jpg)

![tgs 3](tgs_3.jpg)

I was amazed by how large Tokyo Game Show is. If I were to rough estimate its size, I would say it's about 4 times the size of Taipei Game Show. I felt overwhelmed by the energy and the scale of it. If everything comes together, I definitely want to go again next year with a full booth!

# Game Content Update
Good news: as of last month, all the stories (text) and visual novels have been written and put into the internal build of Lily Fantasia!

However, although the story itself wouldn't change, I still need to work on some editing to make the story flow better. We have problems with the prologue(s) in particular, where the story's pacing needs some rework. Other than that (and besides some arts I am still waiting for), the contents of Lily Fantasia is about finalized and done.

However, there are still a lot of potential polishings left on the table. I want to get one final demo update out to present the game "in its best state."

# Demo Update

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


## Stage Update

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

Applying the shader to the dots & changing its texture to an more elegant grid design, this is what we ends up with. See how the patterns don't appear underneath the stage anymore so it looks so much clearer & better (in my opinion)!

