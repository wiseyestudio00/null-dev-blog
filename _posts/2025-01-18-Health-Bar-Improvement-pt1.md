---
title: "Lily Fantasia / Health Bar Improvement, pt. 1"
date: 2025-01-18 19:00:00 +0800
author: null_id
categories: [tecnical, animation]
tag: [code, lilyfantasia]
---

# Introduction

The goal of Lily Fantasia has always been to combine the Action RPG genre with rhythm games. I will probably dig into why I want this in the future. There are so many things and design choices that are worth their own discussion, and I can’t fit them all in the same blog.

Anyway, what screams Action RPG more than a health bar? Currently, there is already a functioning healh bar in the game. However, it's not really up to my standard yet. Today we are just improving the health bar, to make it a lot more Action RPG-like.

(Fair warning, this blog is going to be pretty elementary. I figured I will start by talking about something that’s very simple first, and move onto more complicated things in the future. Also, I am going to treat this as I am writing a tutorial to junior Unity devs.)

This will be separated into 2 parts. In the first part, we will discuss how the code is structured and its design philosophy. In the second part, we will improve the health bar.

I think if you are a beginner Unity developer/game dev, part 1 can help you a lot.

However, if you aren’t a programmer at all, and just want to see the new health bar, feel free to skip to the next part.

# Let’s get started

First of all, let’s see how the health bar in action looks now.

{% include embed/video.html src='/assets/health-bar-improvement-part-1/healthbar.mp4' %}

How it’s structured as a prefab:

![health bar prefab](/assets/health-bar-improvement-part-1/healthbar_prefab.png)

- Background: contains the fire effect, which is an image with a special shader.
- Character: just the image of the main character (he really needs to relax)
- BarBackground: the background of the health bar.
- Bar: the health bar, aka the white piano-like bar.
- NameText: the name of the health bar.

Worth noting that Bar’s Image Type is set to Filled, so we can just use its filledAmount property to control the width of the heath bar. 

![image.png](/assets/health-bar-improvement-part-1/fillamount_1.png)

![image.png](/assets/health-bar-improvement-part-1/fillamount_2.png)

# Waiter, waiter, serve me the Code

Let's look into the MonoBehaviour that controls the Heatlth Bar Display.

`StageHealthBarDisplayMainCharacterDefaultManager.cs`

```csharp
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

using TMPro;

using WiseyeStudio.Lily.UI.TextTag;

namespace WiseyeStudio.Lily.Stage.UI
{
    public class StageHealthBarDisplayMainCharacterDefaultManager : MonoBehaviour, IStageHealthBarDisplay
    {
        [SerializeField] private RectTransform SelfRectTransform;
        [SerializeField] private CanvasGroup SelfCanvasGroup;
        [SerializeField] private TextMeshProUGUI NameText;
        [SerializeField] private Image HealthBarImage;

        public RectTransform RectTransform => SelfRectTransform;

        public float Alpha
        {
            get => SelfCanvasGroup.alpha;
            set => SelfCanvasGroup.alpha = value;
        }

        float TargetNormalizedHealth;
        float CurrentNormalizedHealth;

        bool Initialized = false;
        public void Initialize()
        {
            if (Initialized)
            {
                return;
            }

            CurrentNormalizedHealth = 1f;
            TargetNormalizedHealth = 1f;

            Assert.IsNotNull(SelfRectTransform);
            Assert.IsNotNull(SelfCanvasGroup);
            Assert.IsNotNull(NameText);
            Assert.IsNotNull(HealthBarImage);

            Initialized = true;
        }

        public void SetNormalizedHealth(float normalizedHealth)
        {
            if(Initialized == false)
            {
                throw new System.InvalidOperationException("Not initialized");
            }

            TargetNormalizedHealth = normalizedHealth;
        }

        public void SetName(string name)
        {
            if (Initialized == false)
            {
                throw new System.InvalidOperationException("Not initialized");
            }

            NameText.SetTextAfterProcessCutsomTags(name);
        }

        private void Update()
        {
            if (Initialized == false)
            {
                return;
            }

            CurrentNormalizedHealth = Mathf.MoveTowards(CurrentNormalizedHealth, TargetNormalizedHealth, Time.deltaTime);
            HealthBarImage.fillAmount = CurrentNormalizedHealth;
            HealthBarImage.color = Color.Lerp(Color.red, Color.white, CurrentNormalizedHealth * 2f);
        }
    }
}
```

`IStageHealthBarDisplay.cs`

```csharp
using WiseyeStudio.UI;

namespace WiseyeStudio.Lily.Stage.UI
{
    public interface IStageHealthBarDisplay : IHasRectTransform, IHasAlpha
    {
        public void Initialize();
        public void SetNormalizedHealth(float normalizedHealth);
        public void SetName(string name);
    }
}
```

`IHasRectTransform.cs`

```csharp
using UnityEngine;

namespace WiseyeStudio.UI
{
    public interface IHasRectTransform
    {
        public RectTransform RectTransform { get; }
    }
}
```

`IHasAlpha.cs`

```csharp
namespace WiseyeStudio.UI
{
    public interface IHasAlpha
    {
        public float Alpha { get; set; }
    }
}
```

Okay, so first of all, we have `StageHealthBarDisplayMainCharacterDefaultManager` , which implements the interface `IStageHealthBarDisplayManager`. `IStageHealthBarDisplayManager` defines properties and methods that its users can access, such as `SetNormalizedHealth()`, etc.

Its user should have the prefab, spawn it, and get the `StageHealthBarDisplayMainCharacterDefaultManager` component like this:

```csharp
IStageHealthDisplayManager healthBarDisplay = Instantiate(healthBarPrefab, CanvasRectTransform).GetComponent<IStageHealthDisplayManager>();
healthBarDisplay.Initialize();
healthBarDisplay.SetName("Will to Battle");
healthBarDisplay.SetNormalizedHealth(1f);
```

## Answering Questions

I think a junior dev would have the following questions:

1. It’s SO cringe that you use `if (Initialized == false)` . Don’t you know you can just `if (!Initlialized)` ?
2. Why do we have the `IStageHeatlhBar` interface? There’s only one health bar in the game. We don’t need need this interface, right?
3. Why name it `StageHealthBarDisplayMainCharacterDefaultManager`? It’s so long and the order seems wrong. Wouldn’t a simple `DefaultHealthBarManager` be better?
4. Why do we have an `Initialize()` method? Can’t we just initialize in the `Awake()` or `Start()` functions provided by Unity?

Let me guarantee you I do all these “dumb” things based on years of tears and agony. Let’s answer these questions one by one, shall we?

### 1. Why do you use `if (Initialized == false)`? Don’t you know you can just `if (!Initlialized)` ?

Yes, I can.

However, if I do that, in an uncertain future that may or may not happen, I will spend a whole working day trying to find out why the program isn’t working. I will look through 10000 lines that all seem perfect, get extremely depressed and annoyed, and ultimately find out I accidently have an extra/missing `!`  in a random if statement.

A single `!` is too small, looks too much like a `l` or `i` or `I` . It’s so easy to miss. I say instead of trolling myself in the future, I make the code speaks for itself loud and clear: when `Initialized` is `false` , do something!

### 2. Why do we have the `IStageHeatlhBar` interface?

In theory, that’s true. Currently we can just pack all the functionalities into a single class `StageHealthBarMainCharacterDefaultManager`  and call it a day. However, by creating an interface, we allow our future-selves to create all sorts of possibilities without having to change the other parts of the code.

Let’s say in the future, we want another type of health bar…let’s say Lily gets a health bar with its special animations and effects…all that good stuff.

(Don’t worry, this ain’t a spoiler. Lily MAY or MAY NOT get a health bar. Who knows?).

In this case, we will have to go back to all the code that uses the health bar, update all of them. Just…such a headache.

Instead, the users don’t even have to know what type of health bar, what’s the implementation, animations, or whatever. They just need to know they are updating the health bar correctly, and the implementations will be the rest.

### 3. Why `StageHealthBarDisplayMainCharacterDefaultManager` instead of `DefaultHealthBarDisplayManager`?

I actually learned this during my interview with Nvidia (don’t worry, I got firmly rejected. My destiny and the lack of actual technical skills determine that I can’t work for a mega company), and a senior programmer shines light into my naïve mind.

In short, a class/struct’s name should read like a File System. It’s like layers of folders. When we read `StageHealthBarDisplayMainCharacterDefaultManager` from left to right, we will gradually get the following information in order:

1. `StageHealthBarDisplay` → Okay, this is a Health Bar display in the Stage. If I just want to know what the variable is, I can even stop reading now because I already know what type this is!
2. `MainCharacter`→ It’s a main character’s health bar.
3. `Default`→ It’s the default health bar for the main character.

We will know all the information we need in order!

Now let’s see what if we name it `DefaultMainCharacterStageHealthBarDisplayManager` , how a class’s usually named.

1. `Default` → Okay, it is a default version…of something. We don’t know yet.
2. `MainCharacter` → Default version of the MC’s…what? Character Controller? Health Bar? Dialogue Options? Setting? Save File? Weapon? 
3. `StageHealthBarDisplay` → Alright it’s a health bar display. 

aka, you will have to read the WHOLE thing to know what the class is. So long, so much cognitive load, so……inefficient. You disgust me.

It also comes with an added bonus of easy file organization. Let’s suppose we have a `DefaultHealthBar.cs` and `LilyHealthBar.cs` in a big folder which has other files. In a file system that’s ordered by the name of the files (aka, Unity Editor’s Asset menu), they will be listed in this order:

```csharp
...
...
DefaultHealthBar.cs
...
...
LiyHealthBar.cs
...
...
```

So far apart, and it’s hard to tell they are of the same type, yes?

With our new naming pattern, the file system will be displayed in this alternative order.

```csharp
...
...
...
HealthBarDefault.cs
HealthBarLily.cs
...
...
...
```

I finally understand. It was always meant to be this way. This is the golden path we must all take. Something something Golden Wind.

As to why naming classes so long, I adapted the suggestions in [this video](https://www.youtube.com/watch?v=-J3wNP6u5YU) which I liked a lot. It’s way too good so I won’t even go into it at all lmao just watch it.

### 4. Why use `Initlialize()` instead of MonoBehaviour’s functions?

*Because the order of executions of `Start()` and `Awake()` are not strictly defined*.

Let’s suppose you access health bar’s methods in another Manager’s `Awake()`. The health bar’s `Awake()` may or may not have been executed by Unity. In which case, it would throw an exception.

What’s worse, is that the execution’s orders CAN be different in Build and in Editor. In Editor, the scripts may happen to be executed in the correct order by chance. However, in Build, it may be a different order and results in all kinds of errors. This kind of bug can be painful to figure out.

I choose to initialize the health bar explicitly. I choose to be here. I won’t let Unity be in control of me. I don’t trust it. It will betray me. I reject its evil whispering. The temptation is strong, but I must be stronger. I will be in control of my own fate.

# Okay enough yapping can we start improving now?

Alright, enough yapping. In the next blog, we will finally improve the new health bar by implementing some common health bar features!