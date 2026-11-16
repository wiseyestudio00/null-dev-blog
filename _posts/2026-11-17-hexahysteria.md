---
title: "Hexa Hysteria / Post-mortem Analysis"
date: 2026-11-17 2:50:00 +0800
author: null_id
categories: []
tag: [hexahysteria]
media_subpath: /assets/posts/hexahysteria/
CJKmainfont: Hiragino Sans GB
---

```
Hello players:

Thank you for your support of Hexa Hysteria. 2 years ago, I said I would return to developing it, after I finished developing Lily Fantasia. However, I have come to the realization that this couldn't be. I still love this game and am happy with its stories and gameplay. However, financially, I cannot continue creating content for it. I apologize.

Hexa Hysteria will receive its final content update on 2026's Christmas. It will add in the story of Chapter 40.5 AU. I will also turn off all of its in-game purchases and subscription plan, and release all of its contents for free, as I no longer feel comfortable charging people for a project that will no longer receive content updates.

I have seen online people became very disappointed in the studio - me - over the situation of Hexa Hysteria. I have written a post on why I came to this decision. If you are interested and want a formal explanation, please take a look: https://wiseyestudio00.github.io/null-dev-blog/posts/hexahysteria/

Again, thank you for the support over the years. And again, I am sorry I have failed you. I will keep working on updating Lily Fantasia for now. I hope I see you in the future.
```

Hi, I am NULL, the creator of Hexa Hysteria and Lily Fantasia. Thank you for clicking into this post. I have just formally announced that Hexa Hysteria will not receive more contents after the next one, which fills up a Chapter's story.

This post is an Apology in two senses: first, it is an apology from me to you. I am sorry that I failed Hexa Hysteria, and your trust in me. It is also an Apology as its original meaning in ancient Greek - apologia (ἀπολογία), or a "speech in defense." I will explain how this has come to be - my mistakes, my failures that led up to this decision. I will explain why I failed as a game developer, and why I couldn't continue creating what I love.

By doing so, I don't hope to earn your forgiveness, but just to let you know I didn't give up without struggling. I tried my best, but I was flawed - I am not as talented as I thought I was. And by knowing just how defeated I feel, maybe you would understand this decision better.

# TLDR
- After the next update, which fills up 40.5 AU's story, Hexa Hysteria won't receive any more content updates.
- I will turn off all the in-game products and purchases - the subscription and all the paid song packs and turn them all free as I don't feel comfortable charging people money for Hexa Hysteria anymore.
- I will try to keep Hexa Hysteria on the platforms and maintain all its functionalities long as possible. If it truly is no longer possible, I will let you know again.

If you only care about what will happen to Hexa Hysteria, you don't need to continue reading anymore - thank you for playing and caring about Hexa Hysteria. It was my undeserved honor to have made an impact on this world and to you, regardless if it is positive or negative.

If you are interested in what led to this decision, or what happened in my 6 years of just trying (and failing) to create something great, please feel free to keep reading - even though all of it may just sound like a pale excuse of my personal failure.

# My formal Apology

I have a sense that some, if not the majority, players feel betrayed and angry at me for 2 reasons: first, I am the reason why Hexa Hysteria failed. In that, Hexa Hysteria could have been something greater, but I failed to deliver it. Secondly, I lied about coming back to Hexa Hysteria after I finished developing Lily Fantasia, and I can no longer be trusted as a game developer nor a creator.

Both lines of thought are correct - at the very least, I did lie about coming back to Hexa Hysteria. If so, how can anyone keep supporting me in the future, for a different game or other projects? I have come to the realization that I owe those players - you - a formal apology, and an explanation of what had happened leading to this failure, at the risk that my words may sound just like excuses and dodging the responsibility I have to you.

Therefore, first and foremost, I apologize: My abilities were never what I thought they were and I am sorry for presenting something that looked so promising, only to take it away from you. I didn't realize my failure (which I thought would impact me and me only) may have such negative impact on some people's view on me and the studio, and I will try to learn and improve from what had happened.

The following is a postmortem of what happened to Hexa Hysteria, and how my thinking has changed over the years. I will try to explain the points of failure, and why I think I can't continue creating more content for Hexa Hysteria.

# Postmortem

This section will go through why I cannot continue developing Hexa Hysteria, its short-comings, and the mistakes I made along the way.

## Starting Point

When I started developing Hexa Hysteria in 2021, I was in my sophomore year of college. I was under the delusion that I was capable, smart, visionary, and had something extraordinary - or at the very least, special - to say to the world.

At the time, I saw myself as a writer more than a programmer. Inspired by games like Undertale and Doki Doki Literature Club, I wanted to present my stories in video games' formats, as I believed (and still do) video games are the next frontier of storytelling as an art form.

It is worth noting that I was never much of a rhythm gamer at all. I only played some mobile rhythm games extremely casually, and my total hours in all rhythm games did not exceed 10 hours at the time, if my memories serve me correctly.

Why, you may ask, would I choose to create a rhythm game then? To be honest, looking back, I believe this is the first point of failure: I should not have made a rhythm game. If one were to make an indie game, they should always either choose to create something they are truly passionate about, or aim at something that will make a return financially. As it turned out, rhythm games, to me, fit neither of the criteria. I wasn't "passionate" about rhythm games and I fundamentally did not understand what rhythm gamers would want in a game. In other words, I wasn't familiar with the space, its fans, and its creators.

However, if I am forced to give reasonings as to why I decided to create a rhythm game, there would be 2: first, I was inspired by Rayark's games such as Deemo and Cytus (in the story and aesthetic aspects, not the rhythm game aspect), secondly, rhythm games are unique in that, they can be broken down into a lot of individual levels (charts) that could be made by a lot of people in parallel, shortening the development time and saving me the mental trouble of having to actually "make a game."

This may sound strange, so let me expand on that.

Imagine the goal of the developer is to create 10 hours of content. Take a linear story game like Undertale, that means creating 10 hours of contents that have to **progress** throughout the whole 10 hours. That means having to create a basic structure of a game, and then having to come up with 10 hours of "new content" on top of that - new ideas, gameplay, enemies and stories for the 10 hours. At the time, it was very hard for me to imagine the creative process, let alone to design and create a complete game from start to finish, as I had no experience actually coming up with gameplays at all.

Rhythm games, however, are in a special kind of genre, where each level (charts) follow a basic structure and principles, and once that "structure" has been figured out, level-creation can be outsourced and created in parallel, as long as they follow those principles and meet a certain amount of quality check. Of course, the developer still needs to figure out some special performances for special songs and the tools needed to create those charts, but those are the exceptions and not the rule. In other words, I naively thought if I could figure out the principles and tools for others to create the charts, I wouldn't have to worry about the charts and the gameplay, and thus, could focus solely on the stories, which were the parts that I was actually interested in.

This was a mistake. Not that the idea wouldn't work - I did end up outsourcing the charts, and the charters did a good job in general. The system worked - but that the starting point was just wrong. By thinking that I could just outsource the gameplay, I admitted defeat and avoided acting on it. I admitted that I didn't want to think of the gameplay myself, and instead of taking it head-on and learning from designing a simple game - any game - I instead just "gave up". This was a compromise where one shouldn't have been made, and marked the first point of failure: I wasn't willing to "do the hard part" and made a **compromise**, opting to create a game that I wasn't actually interested in. This kind of compromise, where I gave up on things that I wasn't interested in or felt hard to take on, would become more and more apparent as time went on.

## Failure of Presentation

Hexa Hysteria, in general, was a "good looking game." The UI is "clean" and the artstyle beautiful. However, under the hood, this was another compromise that I made.

The arts in Hexa Hysteria - they were good, no notes. However, it wasn't because of me, but perhaps in spite of me. I merely commissioned the artworks and put them in game. For a time, I was delusional in that I believed I have really good taste in arts, and therefore, maybe entitled to why the artworks are good in Hexa Hysteria, too. I have realized now that the artworks quality has little to nothing to do with me, as I contributed very little to the creation of the artworks. Even if I do have good taste, I failed to elevate the artworks into a "work of art" anyway - more on that later.

On the UI, yes they are clean. However, upon close inspection, signs of amateur work appear. The UI is just composed of simple shapes of white. The style is not consistent across multiple menus, and in general, just averagely bad. It only looks "okay" hidden under a coat of cleaness.

This, again, was my failure. I did not "care" that much about UI, so I gave up on trying to make it good. If I truly cared, I would have taken the time to learn Figma, UI design principles, and create a design documents and style guidelines for the menus, but I didn't. I opted to take shortcuts, and I failed to improve as a creator as a result.

Another general line of failure is the lack of animation, or Live2D. To be specific, I am not saying that the lack of moving characters is a point of failure. I am saying that I failed to create a "bombastic moment". Something that would be shared among the fans and break out to the larger audience. This illustrates my second biggest failure - I failed to see what the players wanted, and never attempted to deliver for the general audience.

It may not be a good comparison, but if we compare Hexa Hysteria and Rotaeno, which also came out around the same time, it's easy to see Rotaeno had high quality art, consistent art style, a "bombastic moment" that is really beautiful (the Boss Song animation of the end of Chapter 1), and just in general way higher quality. Of course, this is not to say Rotaeno is just a commercial product that lacks an artistic vision - I am saying that it recognizes having to create a good commercial product in order to deliver the artistic vision it has. I failed to recognize that - in that I both failed to see what makes a good commercial product, and that I didn't want to act on it.

## Not Willing to Accept Help and the Lack of Ambition

Another big problem of mine is that I was not willing to accept help and criticisms. This is pretty straight forward. When I was making Hexa Hysteria, I believed in my vision, and thus felt like others' opinions were not important or "bad," not worth my considerations, or that they would taint my visions. This had lasted until recently, but I have realized my vision is actually just not that good nor extraordinary, and often times I could have really benefited from having some humility and asked for help from professionals.

When I started creating Hexa Hysteria, while cost isn't a serious concern, I still tried to save money when I shouldn't have. The truth is that if I was serious about creating a good game, I should have hired good artists and designers to work on the game. I was simultaneously trying to create something great, while unwilling to actually put in the cost necessary to create and maintain such a game.

I have tried to improve on this while developing Lily Fantasia, but it didn't work out. This makes me think maybe I am not only not a good developer, but not a good leader and motivator either. I have missed out on my chances to hire some really talented people, and they have moved on.

## Failure of Marketing

I didn't know how to market a game. The hope is that the game would spread across the fanbase by words of mouth, but it never truly happened. I cannot comment on this much, as I still don't know how to market my creations.

## Failure to Deliver Consistent Content

In terms of content updates, you may think it is Quality over Quantity. However, this is not entirely true - the truth is Speed & Quality & Quantity, and lacking just one makes you irrelevant as a live-service game. The truth is that we live in an attention economy, and if you don't make an active effort to stay in the players' consciousness, your creation - no matter how good it is - fades out from the public consciousness.

This, I have to admit, is extremely hard, at least for me. I am not a "people" person. In truth, I always feel an enormous pressure contacting artists, and replying to messages makes me so uncomfortable, I usually have to wait a day just to do so. I also procrastinate, a lot. In truth, I can't get a hold of myself, control my sleep schedule, maintain a good habit of eating and exercising, let alone having to always maintain a game's update schedule on time. Things always seem to fall apart - arts come in late, charts are delayed, and I can't make myself start commission arts and maintain their quality and cost. This always becomes a downward spiral, where I feel nervous about being late to commission the arts, and being late makes me even more nervous and thus avoid doing what I have to do. This usually accumulates in a nervous breakdown where I lose sleep at night, and thus breaking my living habits, making the situation even worse.

## Conclusion on My Shortcomings

All these things combined simply make me not a good indie game developer, and it isn't from the lack of trying. For the past 3 years, I have not gone on any vacation, but just one week with my family. I don't have any day off, and I work every single day of every single week of every single year. It is easy to see that my life style is not healthy. And in spite of my effort, I don't feel myself improve, my skills have stagnated or even regressed, and my taste in arts and knowledge in philosophy didn't improve what-so-ever. I have come to a terrible realization that the 26-year old me is no smarter, motivated, ambitious, or creative than the 16-year old me. It is this realization that made me look back to my past actions, and came to these conclusions.

# Indie Games Are Hard To Make

If you read through the Postmortem, you may be thinking: "well, some of your points are true, but aren't you too harsh on yourself on some aspects?" To that, if I were an employee who was just working for someone, I would say yes. What I am asking for is essentially perfection: a developer who cares about every single aspect on their games, willing to take infinite time to learn infinite skills, can deliver contents quickly in quality and plenty, recognizes the line between art and commercial product and can walk on the line, all the while maintaining a network of artists and creators.

However, the truth is that if an indie game were to be successful, the developer essentially has to be just that good. Even a 7/10, mediocrely successful indie game (that is substantial in its contents, with the gameplay length of 2 hours or so) requires an enormous amount of effort to make. One needs to have skills in so many fields, making a game by oneself is near impossible. The failure, therefore, ultimately comes from my hubris, in believing I am special when the reality is that no one is that special and talented. One must know when to take shortcuts when needed, and ask for help too. Recognize when and where to spend their money on, and which part they should do themselves...... From the moment I failed to do those, my failure was doomed.

# The Finances of Hexa Hysteria and rhythm games

To be clear, Hexa Hysteria never made any money. I funded all of its operation on my own (one may say, out of love of the game). I believe in paying a fair fee for the arts and the songs I use, and paid for every license and commissions, at least at a price point that both sides agree on. At the end, it's just an estimate, but I spent around 100k USD across its life time acquiring songs rights, commissioning arts, and outsourcing charts. The revenue, on the other hand, is around 1000 USD total - not profit, revenue.

Wait, how did you fund this game, then? The truth is that my parents are rich, and I am lucky enough that they are willing to fund my passion projects. However, I am now 26, and have been trying for 6 years to create something that would support my life on its own - and to be honest, neither Hexa Hysteria nor Lily Fantasia came even close.

I feel especially bad, since I received a higher education, and the tuition fee alone is so enormous, that any normal people would look at me, and see a complete failure of investment. Who I could have been and who I actually am has such a hollowing gap, it cannot be overstated just how much of a failure I am to both myself and my family. At least, that is how I feel.

I hope this demonstrates just how inconceivable it is to continue adding content to Hexa Hysteria, at least for the long term future. I just don't think I can spend another 200k, 300k, 400k to just keep creating contents. I may be able to do it now, but what is the end goal? I just can't imagine a future by continuing what has led to my current failures now.

# The Future of Hexa Hysteria

If you are still reading, I must assume that you really care about Hexa Hysteria. It may be really uncomfortable or even triggering to read through my rant about how bad Hexa Hysteria is. However, please don't misunderstand my true feeling. Hexa Hysteria failed as a commercial product, but as a work of art, it does have a few merits. Hexa Hysteria was created from a delusional view of my ability and talents. Nevertheless, in that delusion, something, in some parts of it, was extraordinary.

I cannot comment on the gameplay itself, since I wouldn't claim credit for creating them, but for me, the story is definitely the highlight, and I suspect you are interested in it too. It may truly be one of its kind in the rhythm games space.

When I wrote the story, I thought the story of "Journey's End" was beautiful and emotional but not overly so. A lot of the same genre of stories would have been too melo-dramatic, but "Journey's End" may have hit a good spot, whether that is because I was a good writer or just a product of accident, I couldn't tell. 

Night Blossom is cute and short. It doesn't occupy my mind as much as Journey's End does, but over the years, I still saw some people commenting that they relate to Aiko's feeling and how she saw the world, and that made me happy too.

Of course, the over-arching main story was probably what got you excited, and the biggest shame on my part. I cannot tell you what the story actually is, as it is still in my mind, and is constantly developing and transforming. However, when I look at it, I am ashamed to admit that it is hollow, and not much of a "story" at all. It is full of symbols and abstract meanings, but that is the extent of it - abstract symbols. A story cannot live on symbols alone, that would just be a philosophy essay.

If we are just talking about facts about the story, I suppose there are 3:
- There was always a third chapter for Hexa Hysteria, with the script finished. I tried to create it in game, but for multiple reasons, it couldn't be done. I may consider releasing the script, but it would be a waste of potential.
- I have been, and still am, trying to make a prototype of a new game for the overarching story. It won't be a rhythm game.
- However, I really doubt if I can actually create that game, as I am feeling so defeated and uncertain about myself and the future. For now, I am trying to make a prototype of the game, but if the success rate of indie games remain so low - I don't see why that would change - I doubt I will actually fully finish it.

![New Game Screenshot](newgame_screenshot.png)

# The Future of Wiseye Studio and Me

For now, I am close to admitting a complete and total defeat. Lily Fantasia was supposed to be a genuine attempt of me trying to make it as an indie game developer, to support myself financially and continue for the next game. However, I came out of it defeated, saddened, and maybe awake to the reality.

Whether I want to admit it or not, the landscape of indie games has fundamentally changed with AI. Some players are still pushing back, but I am afraid the effort would be futile. I have seen so many games haphazardly put together with AI, with no and little human artworks, and made it out way more successfully than Lily Fantasia, both financially and receptionally. This isn't a knock on those games, but that at the end of the day, the market doesn't truly demand human artists' works, but demand "fun" above everything else. That is the standard for indie games - not beautiful, human, stylish, but "fun," which always seems to elude me. If a fun game can make money as well as a good game made only by humans, while saving the cost by 10 times and more, then I doubt I can compete in this market - I couldn't even when that wasn't the situation, and now it's impossible.

When did Titanic sink? Was it when its tip sank below the surface of the sea, or when it had hit the iceberg? Was it when the ship set sail without enough lifeboats on it, or when the design of the ship was faulty to begin with?

To be clear, there are still a few updates that Lily Fantasia will receive. They were planned while Lily Fantasia was still in development. You probably guessed it, but I am quite certain for each DLC released, I would just lose more money and time. Nevertheless, these updates are a commitment I made myself, so they will be delivered at the highest quality I can reasonably make them.

For the far future, I am not certain. Again, I feel defeated, and realistically I don't think I will ever have a career in indie game development. The chances are too low mathematically, that even if I have a hundred life times, I still wouldn't make it. After so many defeats and no real victories over the years, I no longer believe in myself. I don't feel as creative and so full of ideas as when I started creating and writing, and I feel my talents have gone away, or maybe I never did have those talents to begin with.

At the same time, I suspect I couldn't stop creating. I will continue trying to make a prototype of the new game. However, as I have realized, "good" is no longer enough. Unless I have something extraordinary, I will not release it publicly, and the chances that I do create something extraordinary is slim. I don't have any expectation for myself.

# Ending

I am sorry that things come to such a depressive conclusion, but in an apology, I think honesty is the one thing I should at least try to convey. I would like to say that I came out of this a better person, and maybe I am, in that my visions are clearer, that I see better of myself who I am. However, in terms of the future, I feel like there is nothing actionable I could do now. Times have changed, and so have I. What I had was a seed, and now the seed has grown into a tree I don't particularly like, but it is who I am now. I will still be trying and struggling, but I won't think so highly of myself anymore.

Will I have something for you in the future? Personally, I hope so, but I don't think so, at least not in the near future. It may be one year from now, or 5 years, or never. I will keep trying and struggling, but until I have something really concrete for you, please don't think anything of that suffering.

Thank you for reading this apology. I hope I see you in the future.