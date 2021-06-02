# Audio Player Example
&copy; 2021 Charles Pisciotta
> A sample UIKit (iOS) app that allows a user to simply play locally stored audio files using [AudioKit](https://github.com/AudioKit/AudioKit).

This sample app displays a list of audio files that are stored locally. The home screen is a simple UITableViewController that lists the audio files as `SoundTableViewCell`s. Each cell contains the name of the audio file and a `PlayingIndicator`. The latter is highlighted when currently playing and, at any given time, only one indicator can be highlighted as only one file can play at once. At the start, no audio plays, so all indicators start unhighlighted and all remain unhighlighted when no audio is playing.

On click of a `SoundTableViewCell`, a `PlayerViewController` is displayed modally. The `PlayerViewController` consists of the following UI elements: a background image consistent with the audio file, a large title at the top displaying the name of the audio file, and a button at the bottom allowing the user to play and pause the sound. When that specific audio file is playing, the button shows a pause icon; when that specific audio file is not playing, the button shows a play icon. Note, if an audio file is playing, only the modal view controller of that audio file will toggle the default button icon.

---

<p align="center">

<img src="/img/launch.png" alt="Launch Screen" width="275" title="Launch Screen" />

<img src="/img/home-default.png" alt="Home Screen with No Music Playing" width="275" title="Home Screen - No Music Playing" />

<img src="/img/home-playing.png" alt="Home Screen with Music Playing" width="275" title="Home Screen - Music Playing" />

<img src="/img/playing-dark.png" alt="Home Screen with Music Playing in Dark Mode" width="275" title="Home Screen - Music Playing - Dark Mode" />

<img src="/img/detail.png" alt="Audio File Player Screen with No Music Playing" width="275" title="Audio Player Detail Screen - No Music Playing" />

<img src="/img/playing.png" alt="Audio File Player Screen with Music Playing" width="275" title="Audio Player Detail Screen - Music Playing" />

</p>

---

## Features

- [x] View locally stored audio files in a table view and determine which, if any, file is currently playing via the `PlayingIndicator`.
- [x] Play and pause audio files on click of a table view cell via a modally displayed `PlayerViewController`.

---

## Known Bug

On startup and when playing audio, the following errors print to the console:

```
AddInstanceForFactory: No factory registered for id
AURemoteIO.h:323:entry: Unable to join I/O thread to workgroup ((null)): 2
```

This error was reported issue on GitHub and can be found [here](https://github.com/AudioKit/AudioKit/issues/2331). It appears that this issue relates to using the simulator and might be unavoidable.

---

## Development Process

**Understanding**

1. Read the instructions to understand the scope of the problem, the features that need to be implemented, and any development constraints.
2. Review the prewritten code to understand the structure of the codebase, the assets included, the technologies used, and the features that need to be implemented.
3. Read the documentation for `AudioKit` to understand the basic use of the framework.

**Design Preparation**

4. Create a basic sketch of what the sample detail view will look like when completed.

**Development**

5. Create a model to hold the Audio File data. This includes the name of the file, the name of the image, and any other metadata.
6. Develop the `SoundTableViewCell` to display a preview of the audio files.
7. Develop the `PlayerViewController` to display a detailed view of the audio file, including its cover image, and to allow play/pause functionality.
8. Complete the play and pause functions in `CPAudioPlayer` to allow for proper audio playback using [AudioKit](https://github.com/AudioKit/AudioKit). This includes enabling playing in the background.

**Testing**

9. Develop now, and throughout the process, unit tests to ensure that the code is functioning properly. In this case, unit tests were set up to ensure that each audio file was successfully played and paused.
10. Use the app and determine any remaining issues, bugs, or improvements.

**Documentation and Clean Up**

11. Write now, and throughout the process, documentation to help for readability and understanding.
12. Ensure that all existing code is written cleanly and efficiently.

**Final Deliverable**

13. Send the finished prototype for review.

---

## Requirements

- iOS 14.0+
- Xcode 12.0+

## Using the application

Download or clone the project to Xcode. Run the code on the simulator or a physical device.

---

## Meta

Charles Pisciotta – Freelance iOS Developer – cpisciottadeveloping@gmail.com

[https://github.com/cpisciotta](https://github.com/cpisciotta/)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
