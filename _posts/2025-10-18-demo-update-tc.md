---
title: "Lily Fantasia / Demo 更新 2025-10-18 （中文）"
date: 2025-10-18 16:00:00 +0800
author: null_id
categories: []
tag: [lilyfantasia]
media_subpath: /assets/posts/demo-update-2025-10-18/
CJKmainfont: Hiragino Sans GB
---

## 前言
沒有前言，直接進入主題吧。

## 操作輸入顯示
這個功能我早就想做了。我希望能在舞台的一角顯示玩家所使用裝置的輸入狀態，大致如下圖所示。

![input display demo](ingame_input_display_concept.png)

加入這個顯示有兩個目的。  
首先，它會在教學關中出現，幫助玩家了解各按鍵的位置。  
其次，這也能成為內建的遊玩錄影方式（不需要再依賴像 OBS 外掛這類工具）。

雖然花了一點時間實作（也包含材質製作），但現在已經完成了。

{% include embed/video.html src='ingame_input_display.mp4' %}

影片中展示的是鍵盤，不過系統同時也支援大部分的手把（目前包含 Switch Pro 控制器、PS5 DualSense 控制器，以及 Xbox Series 控制器）。

## 成就系統
沒錯，遊戲內的成就系統已經實作完成。  
成就類型有各種不同，不過最主要的當然是「完成特定歌曲」這類的成就。

### 成就通知
我花了不少時間製作成就解鎖時的通知動畫。

{% include embed/video.html src='achievement_flush.mp4' %}

在我做過的所有動畫中，這可能是我最喜歡的一個。  
我特別喜歡那個「印章」的動態效果與音效，對我而言非常有成就感。

### 載入畫面轉場更新
在同一段影片中，也能看到更新後的載入畫面轉場。  
原本是單張紙張淡入，現在改成兩張紙從兩側覆蓋整個畫面。  
既然整體走紙張風格，我就希望讓一切更「真實」——也就是所有動畫都應該感覺能在現實中發生。  
未來我也會持續增加這類「真實感」轉場效果。

### 個人頭像與成就選單
如同之前提過的，我一直希望成就系統也能同時擔任「個人頭像」系統，  
讓玩家能選擇已解鎖成就的圖示作為自己的頭像。這個功能現在已經大致完成。

{% include embed/video.html src='changing_pfp.mp4' %}

如影片開頭所示，玩家也能選擇使用自己在 Steam 上的預設頭像，  
而遊戲中顯示的名稱也會同步為 Steam 用戶名稱，取代目前暫用的「Kenji Hiano」。

既然現在已經能顯示 Steam 的使用者名稱，我也在思考是否還有必要另外提供更改遊戲內名稱的功能。  
畢竟 Steam 本身似乎不允許玩家把自訂文字上傳到他們的資料庫，  
要做一套可運作的系統會相當麻煩……

![Profile Picture Menu](profile_picture_menu.png)

此外，也有一些成就需要「進度」才能完成，就像上圖所示的那樣。  
遊戲中也會顯示提示，讓玩家知道自己在該成就的完成進度。

## 格擋首拍動畫
目前遊戲中有一個提示動畫，用來幫助玩家掌握「格擋序列」的首拍時機（也就是何時開始格擋）。  
但現階段的版本並不太直覺，我一直希望能加入類似 ARPG 的效果：  
出現一個外圈，並逐漸縮小直到碰到內圈。

{% include embed/video.html src='new_firstbeat_animation.mp4' %}

現在這個效果已經實作完成。雖然還不是最終版本，但我覺得目前的狀態已經可以展示給大家看了。

## 結語
目前我正著手將 Steam 其他功能整合進遊戲中，  
首要目標是排行榜（leaderboards）。  
不過我發現無論是 [Facepunch](https://wiki.facepunch.com/steamworks/) 或 [Steamworks.Net](https://steamworks.github.io) 的介面，都不太符合我的需求。  
因此，我目前正在基於 Steamworks.Net 製作一個符合現代 C# 風格的包裝類別。  
未來可能會將這個實作結果公開到 GitHub，  
作為其他想使用 Steamworks 的初學開發者參考。
