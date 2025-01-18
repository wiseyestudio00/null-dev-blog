---
title: "Health Bar Improvement, pt. 2"
date: 2025-01-13
---

- [Preface](#preface)
- [How it is Now](#how-it-is-now)
- [What do we want?](#what-do-we-want)
- [Delay Animation Effect](#delay-animation-effect)
  - [Future improvements](#future-improvements)
  - [Suspicious edge cases](#suspicious-edge-cases)

# Preface
One hard truth  I learned about myself is that, most of the time, I think I know what I want, but more often than not I actually only *FEEL like I know what I want*.
We should really start by figuring out what the current Health Bar is lacking here first. However, in order to do that, we need to see what it IS DOING NOW.

# How it is Now
The most important part is in  `Update()`.

```csharp
private void Update()
{
    if (!Initialized)
    {
        return;
    }

    CurrentNormalizedHealth = Mathf.MoveTowards(CurrentNormalizedHealth, TargetNormalizedHealth, Time.deltaTime);

    HealthBarImage.fillAmount = CurrentNormalizedHealth;
    HealthBarImage.color = Color.Lerp(Color.red, Color.white, CurrentNormalizedHealth * 2f);
}
```

First of all, we set `CurrentNormalizedHealth` to the result of `Mathf.MoveTowards`. `MoveTowards` is a handy function in Unity's builtin Math library. It just "moves" the current value towards the target, by the value of `Time.deltaTime` of a time. Of course, we use `Time.deltaTime` to make sure `CurrentNormalizedHealth` is adjusted according to the framerate.

(If you don't know what "normalized" mean, it means the number is a percetange, aka. 0% ~ 100%. In programming, it's usually represented by a float ranging from 0 ~ 1, so 0.9 would represent 90%.)

So if TargetNormalizedHealth has changed, `CurrentNormalizedHealth` will be changed into it __linearly__ over time.

Before we continue, we can really use a Speed variable to contril how fast the value of `CurrentNormalizedHeatlh` is adjusted. Let's do it now.

```csharp
float HealthChangeSpeed = 1f;
private void Update()
{
    if (!Initialized)
    {
        return;
    }

    // added HealthChangeSpeed
    CurrentNormalizedHealth = Mathf.MoveTowards(
        CurrentNormalizedHealth, TargetNormalizedHealth, HealthChangeSpeed * Time.deltaTime );

    HealthBarImage.fillAmount = CurrentNormalizedHealth;
    HealthBarImage.color = Color.Lerp(Color.red, Color.white, CurrentNormalizedHealth * 2f);
}
```

After we finish adjusting the value of `CurrentNormalizedHealth`, we update the UI. First, it set the `fillAmount` of Health Bar directly to the value of `CurrentNormalizedHealth`. So if `CurrentNormalizedHealth` is 0.2, `fillAmount` will also be 0.2, which means it's 20% filled.

We do something similiar to the Color, which lerps between Red and White. What's worth mentioning is that we did a sneaky `* 2f` to lerp the Color twice as fast, so when `CurrentNormalizedHealth` is 0.5, Color will still be white. The Health Bar only turns Red after `CurrentNormalizedHealth` is under 0.5.

# What do we want?
I want to start by seeing what a normal Action RPG's health bar would behave. Where else to start but the best rhythm game from 2017: Sekiro: Shadows Die Twice?

https://youtu.be/mLdvbW9WdcI?t=1475

Okay, so this health bar actually has 2 layers. A Red Layer on top, which is the actual health, and a White Layer under the Red Layer. When Sekiro takes damage, Red Layer is immediately changed to the new health, but the White Layer stays at the original health for a while, before decreasing to the new health.

This is a pretty basic behaviour for most health bars: it lets the players know just how much health has been lost by delaying the actual animation. Simple yet effective, what's not to love?

*WELL*, I do have 2 critics: the White Layer is decreasing at a linear speed. I think it can use some juice with some [Easing](https://easings.net/en). Second of all, when the player heals, the Top Layer also increases to the new amount immediately. [It looks a bit jarring](https://youtu.be/EIGWOOFz2Fw?list=PLzAV3MmF_ZhKygZFPd6vVpqif5t_1AVlr&t=4000).

I think Fromsoft wants to let the players know the exact amount of their health as soon as possible, which makes sense. I won't touch on this for now. On the other hand, I think I will add some Easing to the animation at the end.

However, since I am pretty sure I want the `Delay Animation Effect`, let's do that first, then move on to make the easing happen.

# Delay Animation Effect
First of all, let's add a second Bar Image, aka the bottom layer.

```csharp
[SerializeField] private Image HealthBarImage;
[SerializeField] private Image DelayBarImage;
```

Adjust the Prefab's structure accordingly......
![Image](/lily-dev-blog/asset/health-bar-improvement-part-2/healthbar_prefab_update.png)

To delay, of course we will need to start by tracking time. Let's start by adding and renaming the variables first.

```csharp
// private float TargetNormalizedHealth: deleted, since we are 
private float CurrentNormalizedHealth;
// the current Fill Amount of the Delay Bar
private float CurrentDelayBarFillAmount;

private float SecondsElaspedSinceHealthUpdated;
// Make the speed a const float for clarity.
private const float DELAY_BAR_ANIMATION_SPEED = 1f;
// How long should the Delay Bar stay on screen before its animation plays.
private const float DELAY_TIME_IN_SECONDS = 0.3f
```

Also let's do some Separation of Concern (SoC) first: create a new function named `UpdateDisplay()` that...updates the display according to the current values.

```csharp
private void UpdateDisplay()
{
    HealthBarImage.fillAmount = CurrentNormalizedHealth;
    HealthBarImage.color = Color.Lerp(Color.red, Color.white, CurrentNormalizedHealth * 2f);
    DelayBarImage.fillAmount = CurrentDelayBarFillAmount;
}
```

Obviously we will need to adjust the `Update()` function, but we need to start by re-implementing SetNormalizedHealth() first, since that's where everything starts.

```csharp
private float TimeElapsedSinceTargetChanged;
public void SetNormalizedHealth(float normalizedHealth)
{
    if(Initialized == false)
    {
        throw new System.InvalidOperationException("Not initialized");
    }

    // If the health is the same, do not update.
    // We need TimeElapsedSinceTargetChanged to only change when health actually updates.
    if (Mathf.Approximately(normalizedHealth, CurrentNormalizedHealth))
    {
        return;
    }

    // Since we are not changing the actual Heatlh Bar over time anymore, let's just set the CurrentNormalizedHealth to the new value immediately.
    CurrentNormalizedHealth = normalizedHealth;
    // when health is updated, set timeElasped to 0f.
    TimeElapsedSinceTargetChanged = 0f;
    
    // let's also adjust the top HealthBar immediately, just like Sekiro.
    UpdateDisplay();
}
```

We can move on to `Update()` now. Let's see......

```csharp
private void Update()
{
    if (Initialized == false)
    {
        return;
    }

    // wait until DELAY_TIME_IN_SECONDS is reached
    if(SecondsElapsedSinceHealthUpdated < DELAY_TIME_IN_SECONDS)
    {
        SecondsElapsedSinceHealthUpdated += Time.deltaTime;
        return;
    }

    // MoveTowards CurrentDelayBarFillAmount like we did with TargetNormalizedHealth 
    CurrentDelayBarFillAmount = Mathf.MoveTowards(
        CurrentDelayBarFillAmount, CurrentNormalizedHealth, Time.deltaTime * DELAY_BAR_ANIMATION_SPEED);

    UpdateDisplay();
}
```

And...that's it, Let's see if the new implementation works.

<video src="/lily-dev-blog/asset/health-bar-improvement-part-2/healthbar_1.mp4" controls="controls" style="max-width: 730px;"></video>

And...it works, exactly like what we see in Sekiro actually. We may need to play around the DELAY_BAR_ANIMATION_SPEED and DELAY_TIME_IN_SECONDS to see what feels right, but if our goal is to just recreate Sekrio's health bar, we have basically done it.

However, I did say I want to add Easing to the animation. Let's do that too.


```csharp
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

using Sirenix.OdinInspector;
using TMPro;

using WiseyeStudio.Lily.UI.TextTag;

namespace WiseyeStudio.Lily.Stage.UI
{
    public class StageHealthBarMainCharacterDefaultManager : MonoBehaviour, IStageHealthBar
    {
        [Required]
        [SerializeField] private RectTransform SelfRectTransform;
        [Required]
        [SerializeField] private CanvasGroup SelfCanvasGroup;

        [Title("UI")]
        [Required]
        [SerializeField] private TextMeshProUGUI NameText;
        [Required]
        [SerializeField] private Image HealthBarImage;
        [Required]
        [SerializeField] private Image DelayBarImage;

        public RectTransform RectTransform => SelfRectTransform;

        public float Alpha
        {
            get => SelfCanvasGroup.alpha;
            set => SelfCanvasGroup.alpha = value;
        }

        private float CurrentNormalizedHealth;
        private float CurrentDelayBarFillAmount;
        private float DelayBarFillAmountAtStart;
        
        private float SecondsElapsedSinceHealthDecreased;
        private const float DELAY_BAR_ANIMATION_SPEED = 0.15f;
        private const float DELAY_TIME_IN_SECONDS = 0.75f;

        private float SecondsElapsedSinceDelayBarStarts = 0f;
        private float CurrentDeplayBarAnimationDurationInSeconds = 0.1f;
        // represents the total time the delay bar animation will take to cover the whole health bar
        private const float DELAY_BAR_ANIMATION_TOTAL_TIME = 2f;

        bool Initialized = false;
        public void Initialize()
        {
            if (Initialized)
            {
                return;
            }

            CurrentNormalizedHealth = 1f;
            CurrentDelayBarFillAmount = 1f;
            SecondsElapsedSinceHealthDecreased = 0f;

            Assert.IsNotNull(SelfRectTransform);
            Assert.IsNotNull(SelfCanvasGroup);
            Assert.IsNotNull(NameText);
            Assert.IsNotNull(HealthBarImage);
            Assert.IsNotNull(DelayBarImage);

            Initialized = true;
        }

        public void SetNormalizedHealth(float normalizedHealth)
        {
            if(Initialized == false)
            {
                throw new System.InvalidOperationException("Not initialized");
            }

            float previousNormalizedHealth = CurrentNormalizedHealth;
            CurrentNormalizedHealth = normalizedHealth;

            // if health decreased, start delay bar animation
            if (previousNormalizedHealth > CurrentNormalizedHealth)
            {
                DelayBarFillAmountAtStart = CurrentDelayBarFillAmount;
                // calculate current animation's duration
                CurrentDeplayBarAnimationDurationInSeconds = DELAY_BAR_ANIMATION_TOTAL_TIME * Mathf.Abs(CurrentDelayBarFillAmount - CurrentNormalizedHealth);
                // so the animation won't be "instant" and the easing effect will always show
                CurrentDeplayBarAnimationDurationInSeconds = Mathf.Min(0.2f, CurrentDeplayBarAnimationDurationInSeconds);

                SecondsElapsedSinceHealthDecreased = 0f;
                SecondsElapsedSinceDelayBarStarts = 0f;
            }

            UpdateDisplay();
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

            if(SecondsElapsedSinceHealthDecreased < DELAY_TIME_IN_SECONDS)
            {
                SecondsElapsedSinceHealthDecreased += Time.deltaTime;
                return;
            }

            SecondsElapsedSinceDelayBarStarts += Time.deltaTime * DELAY_BAR_ANIMATION_SPEED;
            float lerp = Mathf.Clamp01(SecondsElapsedSinceDelayBarStarts / CurrentDeplayBarAnimationDurationInSeconds);
            float easedLerp = EasingFunctions.EaseOutQuart(0f, 1f, lerp);
            CurrentDelayBarFillAmount = Mathf.Lerp(DelayBarFillAmountAtStart, CurrentNormalizedHealth, easedLerp);

            UpdateDisplay();
        }

        private void UpdateDisplay()
        {
            HealthBarImage.fillAmount = CurrentNormalizedHealth;
            HealthBarImage.color = Color.Lerp(Color.red, Color.white, CurrentNormalizedHealth * 2f);
            DelayBarImage.fillAmount = CurrentDelayBarFillAmount;
        }
    }
}
```

## Future improvements
- I want to move the actual health bar smoothly, instead of setting it to the new value immediately.
- I want the fire effect to change color according to the current health.
- I want Main Charater's sprite to change according to health (he becomes more tired/damaged as his health reduces.)
- Mordern CPU is powerful enough that it doesn't even really matter, but we can still have improve the performance by only adjusting the Images' `fillAmount` and `Color` when needed (aka when the values actually change).

## Suspicious edge cases
- Can the animation handles really rapid change of health?
- What happens when SetNormalzedHealth takes in a value that's out of the expected range?
  - What happens when a negative value is inputed?
- What happens when health is decreased again, while Delay Bar's animation is still playing?

However, I am running out of time. When I wrote this, it is 2025/1/14, and the Demo is set to become public on 1/17. This means I will need to finish the public Demo in the next 72 hours, and there is so much to do still. So I have to pause the improvement for now...