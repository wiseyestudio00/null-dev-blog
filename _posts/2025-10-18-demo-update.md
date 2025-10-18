---
title: "Lily Fantasia / Demo Update 2025-10-18"
date: 2025-10-18 16:00:00 +0800
author: null_id
categories: []
tag: [lilyfantasia]
media_subpath: /assets/posts/demo-update-2025-10-18/
CJKmainfont: Hiragino Sans GB
---

## Introduction
There is no introduction. Let's just get straight into business.

## Input Display
I have wanted this feature for a long time now. I want a small display of whatever device that the player is using to be displayed at a corner in stage, as such.

![input display demo](ingame_input_display_concept.png)

There are 2 purposes of having such display. First, it will be displayed in the tutorial to help the players finding where the keys are. Secondly, it can be a built-in way for players to record their gameplay (instead of having to rely on a OBS plugin, for example.)

It took some time to implement (and create the textures), it is done.

{% include embed/video.html src='ingame_input_display.mp4' %}

It's a keyboard in the video, but it also supports all gamepads (well, most of them at the moment. Specifically Switch Pro Controller, PS5 Dual Sense controller, and the Xbox Series controller).

## Achievements
Yep, in-game achievement is implemented. There are various kinds of achievements, but of course the main ones would be "To Finish A Specific Song."


### Achievement Notification
I spent a good amount of time creating the in-game notification when you unlocked an achievement.

{% include embed/video.html src='achievement_flush.mp4' %}

Of all the animations that I have created, this one is probably my most favored. I really like the stamp animation and SFX. It is very satisfying, at least for me.

### Loading Screen Transition Update
In the same video, I also showed the updated Loading Screen Transition, where instead of a Paper fading in, it's now 2 separate papers covering up the screen. I realized since I was already going for a paper aesthetic, I should make every "realistic," aka every animation in-game should feel like they can happen in real life. I plan to implement more of these "real" transitions in the future.

### Profile Picture and Achievement Menu

As mentioned before, I have always planned for the achievement system to also be the profile picture system, where you can select an unlocked achievement's icon to be your profile picture. It's roughly implemented now.

{% include embed/video.html src='changing_pfp.mp4' %}

As you can see, you would also have a choice to use your default Steam Avatar as well (as shown in the beginning of the video), and your name in-game will also be your Steam username, instead of the "Kenji Hiano" right now.

Now I have implemented a way to display your Steam username as your name in-game, I am wondering if it is even necessary to provide a way to change your in-game name anyway. It seems Steam does not allow the user to submit a string to their database anyway, so it would be hard to make a system for it......

![Profile Picture Menu](profile_picture_menu.png)

There will also be achievements that require a "progress" to finish, such as the one shown in the image above. There will be hints in-game as how far you have progressed such achievements as well.

## Deflect First Beat Animation
Currently, there is an animation to help players to know when the "First Beat" of a Deflect sequence will happen (aka, when should the player start deflecting.) However, it's not really helpful at the moment. I have always dreamed of a more ARPG-like animation where a Circle will appear and shrink until it touches an inner, smaller circle.

{% include embed/video.html src='new_first_beat_animation.mp4' %}

So it's done. This is not the final version of the animation, but I think it's good enough to be shown to you now.

## Conclusion
Currently, I am working on implementing other Steam's functionalities in-game, most notably leaderboards first. However, I have found either [Facepunch](https://wiki.facepunch.com/steamworks/) nor [Steamworks.Net](https://steamworks.github.io)'s interface to suit my needs enough, so currently I am implementing a wrapper class around Steamworks.Net to fit for a more modern c# style. I will perhaps publish my implementation of the result to a public Github repo as references for future junior developers who also want to use Steamworks in the future.