---
title: "Lily Fantasia / Fixing Performance Part 1"
date: 2025-12-06 16:00:00 +0800
author: null_id
categories: []
tag: [lilyfantasia]
media_subpath: /assets/posts/fixing-performance-2025-12-06/
CJKmainfont: Hiragino Sans GB
---

## Introduction
I don't think it's a secret that Lily Fantasia always has planned to be ported to Switch. It is part of the reason why the development took so long (specifically to support and provide a seamless experience for all controllers: Keyboard, Keyboard & Mouse, and Gamepad), although not the only reason.

Nevertheless, since the game needs to run on Nintendo Switch, and there will be people purchasing it, I need to make sure the game runs as well as possible. Mainly, during the rhythm game part, I NEED the game to run at stable 60 fps. Either it's 60 fps or nothing.

Since most of the contents are in place, I finally have the time to start working on improving the performance.

## Nintendo Switch
For those who have played Lily Fantasia, you may think there won't be any problem with Lily Fantasia's performance. And if you are playing on PC or a Mac, you would be right. I have personally checked that Lily Fantasia can run at at least 60 fps on mid-level machines that came out even 5 years ago (I remember a fan told me Lily Fantasia can run smoothly on a 10-years old laptop).

However, even though we all have a vague understanding that Nintendo Switch is not a powerful machine, I think we don't actually understand just how weak it is. The Nividia Tegra X1 chip in it was created in 2015, which is 10 years ago. It's the equivalent of a high-end mobile devices in 2015; not end of the world bad, but still not plenty of room to work with. There is a reason why most games on Switch runs at 30 fps.

## The Current Performance
Before we began, I checked just how bad Lily Fantasia is runnng on Switch. So I build the game, run it, and record the framerate at different sections.

### Normal Gameplay
This is the basic rhythm game part. There isn't much post-processing effects going on, and most of the effects are on the background. As the combo climbs higher, the rainbow gradient in the background becomes more intense, and the grid-pattern moves faster. There is also a BPM Visual, the black gradients at the top and bottom of the screen that "vibrate" according to the BPM of the song.

![Low Combo](NormalPlay_LowCombo.png)

![High Combo](NormalPlay_HighCombo.png)

The CPU spends roughly 22 ms, while the GPU spends 13 ms to update during these sections, and the framerate (after Vsync) would be around 30 fps with occansional spikes. Obviously it's not acceptable.

### Deflect Gameplay
During gameplay, sometimes an enemy will appear and attack you, and you will have to "deflect" their attacks by pressing a button at the exact same rhythm as their "heartbeats."

https://www.youtube.com/watch?v=qShv_D1lsCs

![Deflect](Deflect.png)

I think most of us can agree this looks more visually impressive then the more gameplay part, although it just pulls some tricks with the post-processing effects. Specifically, I apply some Zoom Blur and Motion Blur, and adjust their intensity and pivot to follow the character and their attacks. It's rather simple, but really effective.  (On a side note, I did not write these effects myself. They are from [this tutorial](https://www.youtube.com/watch?v=qShv_D1lsCs), I just modified the effects a bit so they have a Pivot to follow the character).

The CPU spends **22 ms**, about the same as the Normal Gameplay section, but the GPU jumps to **20 ms**, way past the limit of 16 ms too.

### The Most Intense Part
I can not show it here, but there is a part of the game that uses not just Motion Blur and Zoom Blur, but 4 other post-processing effects, and on top of that, special effects on the character too. During this part, the GPU usage would jump to **26 ms**, and sometimes a really bad frame would happen, causing the game to run at barely **15 fps**.

This is worrying because remember, the goal is **steady 60 fps**. It's hard to tell if it's even possible to reach performance while retaining all of the visual effects.

## What Impacts FPS Anyway?
As a reminder, since we are targetting 60 fps, it means we have 16.666 ms per frame to work with. It roughly means neither CPU and GPU can use more than 16 ms per frame. Note that CPU and CPU **each** has 16 ms to work with since they run mostly in parallel.

However, that also means if just one of the components uses more than 16 ms, the framerate would be impacted: if CPU uses 8 ms, but GPU uses 20 ms, then the game can only update every once 20 ms at most.

## CPU
To put it simply, CPU is in charge of everything that doesn't directly involve drawing graphics. That includes: raycasting, physics, collider detection, etc. Thankfully, since Lily Fantasia is a rhythm game, it uses almost none of these functions, which means Lily Fantasia should be rather light on CPU usage.

If that's the case

## Conclusion
I have always known optimization is importnat for games on Nintendo Switch, and  gain a new appreciation for all games on Switch. 

Also how did Cytus come out in 2012 on mobile devices? Am I missing something? What?