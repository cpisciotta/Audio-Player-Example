# SoundMind Audio Player Interview Question
We use this exercise to assess your experience with iOS and Swift development. We have setup a base project with a few Swift files and a number of sounds (wav files).

## Instructions
You should clone this repo and open the Xcode Project. In it you will find a number of skeleton files to help get you started. Your goal is to build a mini sound player using [AudioKit](https://github.com/AudioKit/AudioKit). We use AudioKit within our apps at SoundMind, so we would like to use this exercise for you to gain a little familiarty with the tool.

Your goal is to build an app that has a home screen that looks something like this:

![Example Home Screen](/example-home-screen.png)

You can see it shows a list of sounds, with an indicator on the left that shows whether or not this particular track is currently playing. The primary screen here is the `HomeViewController` and each cell is a `SoundTableViewCell`. These have both been created and partially implemented, it is up to you to complete the implementation so your app is similar to the above design.

You can tap on a sound it will take you to a "detail" screen that allows you to play or pause the track. This screen is up to you to design and implement.

When a user taps on the "play" button, that should be reflected in the home screen with an green "playing" indicator on the appropirate row. If there is no sound playing, no cell should have a green playing indicator next to it.

## Guidance
You are welcome to use any online resources to commplete this project. We particuarly recommend looking at the documentation for AudioKit 5 and AVFoundation.

We have provided this template to get started and we believe it to be correct and working properly, however if you encounter any issues or think there may be a mistake, please do not hesitate to reach out.

We estimate this task to be able to be completed within a few hours, however, that is just a guideline. We may give you a deadline to complete this project, however you are welcome to take as much time before that deadline to work on your code.
