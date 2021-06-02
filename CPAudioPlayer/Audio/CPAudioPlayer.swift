//
//  CPAudioPlayer.swift
//  CPAudioPlayer
//
//  Originally created by Jason Silberman on 12/3/20.
//  Updated and implemented by Charles Pisciotta.
//  Copyright © Charles Pisciotta All rights reserved.
//

import Foundation
import AudioKit
import AVFoundation

final class CPAudioPlayer {
	static let shared = CPAudioPlayer()
	
	private let engine: AudioEngine
	
	private var player: AudioPlayer?

    /// The currently playing song
    private (set) var currentlyPlaying: String? = nil
	
	private init() {
		self.engine = AudioEngine()
        setupBackgroundAudio()
	}

}

// MARK: - Public Methods - Start and Stop Audio
extension CPAudioPlayer {

    /// This function begins playing a sound.
    /// - Parameter sound: The filename of the sound to play excluding its `wav` extension.
    /// - Returns: If the sound successfully begins playing, returns true. Otherwise, returns false.
    func play(sound: String) -> Bool {

        guard let fileURL = Bundle.main.url(forResource: sound, withExtension: "wav") else { return false }

        do {
            let audioFile = try AVAudioFile(forReading: fileURL)
            let isPlaying = startPlaying(file: audioFile)

            // Update the name of the song currently playing if attempt was succesfful
            if isPlaying { self.currentlyPlaying = sound }

            return isPlaying
        } catch {
            print("Error in play(sound:)", error)
            return false
        }
    }

    /// Stops or pauses the currently playing sound.
    func pause() {
        engine.stop()
        player?.stop()
        currentlyPlaying = nil
    }
}


// MARK: - Private Method - Start Playing Audio
extension CPAudioPlayer {
    private func startPlaying(file: AVAudioFile) -> Bool {
        guard let buffer = try? AVAudioPCMBuffer(file: file), let player = AudioPlayer(buffer: buffer) else { return false }
        self.player = player

        player.volume = 1
        player.isLooping = true
        engine.output = player

        do {
            try engine.start()
            player.play()

            return true
        } catch let error {
            print("ERROR in `startPlaying`: \(error)")
            return false
        }
    }
}

extension CPAudioPlayer {
    func setupBackgroundAudio() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }

}
