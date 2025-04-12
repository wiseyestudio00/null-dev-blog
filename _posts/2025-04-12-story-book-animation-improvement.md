---
title: "Lily Fantasia / Story Book Animation Improvement"
date: 2025-04-12 19:00:00 +0800
author: null_id
categories: [animation]
tag: [lilyfantasia]
media_subpath: /assets/posts/story-book-animation-improvement/
CJKmainfont: Hiragino Sans GB
---

# Life Update

Recently, I went to a Second-Hand Book Store near my home. I was not expecting much, but when I stepped into the book store, I was kind of shocked.

![Book Store](book_store.jpg)

Surely there are a lot of books. However, it also displays a complete inverse relationship between the amount of books and the amount of organization. It felt like I fell into the Backroom.

I am a book lover (can you tell by now?), so it's kind of like a random Gacha for me to go through the book store. I walked for a while and picked up some interesting books. However, I was actually shocked when I saw a full collection of *Hoshin Engi* by *Ryu Fujisaki* in Japanese, all 23 volumes of it. The manga ran from freaking 1996~2000, and the last volume was supposedly printed in 2000.

![Hosin Engi](hosin_engi.jpg)

I know they are repackaged, because for some reasons there are actually 2 volume 14. However, I just think it's so rare to see a full collection of old mangas, I just had to buy it. So bought it I did. I wonder if they are fake, though. They very much could be fake. I guess I will need to open them and see their copyright page and investiage the print quality.....later.

I also bought a bunch of old military encycopidias. They aren't some ancient valuable books, and I am not a military nerd, but I still bought them as a collection of (what I think are) beautiful paintings of war machines.

![Other Books](other_books.jpg)

The store is run by a 79-year-old man. We talked for a while. I think he may be one of the last cultural people from the previous generation. It saddens me that something special here (I can't put it to wordss) will be lost very soon. Thankfully I have my phone by my side and I open YouTube Shorts and I just forget about my saddness and everything and my feelings are numb which is good.

# Story Book
In Lily Fantasia's Story Mode (we call it Story Journey), there is a book. You would flip through its page to progress the story. Of course, there would need to be a Page Flipping animation. Here's the animation now.

{% include embed/video.html src='story_book_v1.mp4' %}

It works. However, it's very static and not that interesting to look at. I think it needs more movements.

My first idea is to displace its X position and Z-axis, so it looks like it's being "pulled" by the player.

{% include embed/video.html src='story_book_v2.mp4' %}

It looks better. However, I want it to be more bouncy / human. I used several Easing, and reached the conclusion that I will need to use OutCubic when displacing the book, and OutBack when placing it back.

{% include embed/video.html src='story_book_v3.mp4' %}

It's even better now. But I still think it could be improved. I think it may be interesting to make the book takes longer to be pulled, and shorter when placing it back, so it's more tight and snappy.

{% include embed/video.html src='story_book_v4.mp4' %}

I think I can rotate around the Y-axis too, so the interace would look more "3D."

{% include embed/video.html src='story_book_v5.mp4' %}

Looking good. Lastly, I would add some randomness to the angles and displacement everytime so it stays interesting.

{% include embed/video.html src='story_book_v6.mp4' %}

Oh, I also added some stickers! For Fun!

# Conclusion
When you improve, only the distance between you and the flawed changes; the path to perfection remains infinite.