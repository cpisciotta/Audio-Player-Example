//
//  AudioFile.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import Foundation

/// A struct containing the metadata for the locally stored audio files.
struct AudioFile: Identifiable {
	/// The id value representing the index of the audio file offset by 1.
	let id: Int

	/// The name of the audio file as seen in the `Sounds` group.
	///
	/// - Note: This string should not include the `wav` extension.
	let name: String

	/// The name of the image file associated with the audio file as seen in the `Assets` catalog.
	///
	/// - Note: This string should not include the `jpg` extension.
	let imageName: String

	/// The user-facing description of the audio file.
	let description: String
}

// MARK - Local Test Data
extension AudioFile {
	/// A factory function to retrieve the locally stored audio files.
	/// - Returns: An array of `AudioFile`s containing all of the metadata for the locally stored audio files.
	static func getAudioFiles() -> [AudioFile] {
		return [AudioFile(id: 1, name: "Swamp", imageName: "swamp", description: "Swamp noise"),
				AudioFile(id: 2, name: "Ocean Waves", imageName: "waves", description: "Ocean waves noises"),
				AudioFile(id: 3, name: "Light Rain", imageName: "light-rain", description: "Light rain noise"),
				AudioFile(id: 4, name: "Heavy Rain", imageName: "heavy-rain", description: "Heavy rain noise"),
				AudioFile(id: 5, name: "Wood Fire", imageName: "wood-fire", description: "Wood fire noise"),
				AudioFile(id: 6, name: "Winds", imageName: "wind", description: "Wind noise")]
	}
}
