//
//  PlayerViewController.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import UIKit

/// A delegate to handle when audio playing starts and stops.
protocol PlayerDelegate {

	/// Indicates that audio has successfully begun playing.
	/// - Parameter id: The id value of the `AudioFile`.
	func didStartPlaying(id: Int)

	/// Indicates that audio has successfully stopped playing.
	/// - Parameter id: The id value of the `AudioFile`.
	func didStopPlaying(id: Int)
}

class PlayerViewController: UIViewController {

	// MARK: - Image Name Constants
	private let playButtonImageName = "play"
	private let pauseButtonImageName = "pause"

	// MARK: - UI Elements
	private let imageView = UIImageView()
	private let titleView = UILabel()
	private let button = UIButton(frame: .zero)

	// MARK: - UI Constants
	private let buttonDiameter: CGFloat = 75.0

	// MARK: - Shared Player
	private let player = CPAudioPlayer.shared

	// MARK: - VC Properties
	var playerDelegate: PlayerDelegate!
	var audioFile: AudioFile!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		view.backgroundColor = .black
		addImageView()
		addTitle()
		addPlayPauseButton()
	}
}

// MARK: - Add UI Elements
extension PlayerViewController {
	func addImageView() {
		// Check if image exists, otherwise default black background
		guard let image = UIImage(named: audioFile.imageName) else { return }

		// Set image properties
		imageView.image = image
		imageView.contentMode = .scaleToFill
		imageView.alpha = 0.5

		view.addSubview(imageView)

		// Auto Layout
		imageView.setupAutoLayout()
		imageView.constrainAsFullSize(to: view)
	}

	func addTitle() {
		// Setup title properties
		titleView.text = audioFile.name
		titleView.font = .systemFont(ofSize: 40.0)
		titleView.textColor = .white
		titleView.textAlignment = .center

		view.addSubview(titleView)

		// Auto Layout
		titleView.setupAutoLayout()

		titleView.constrainTop(to: view.topAnchor, offset: 40.0)
		titleView.constrainLeadingEdge(to: view.leadingAnchor)
		titleView.constrainTrailingEdge(to: view.trailingAnchor)
		titleView.constrainHeight(to: 50.0)
	}

	func addPlayPauseButton() {

		// Set button properties
		button.frame = CGRect(x: 0, y: 0, width: buttonDiameter, height: buttonDiameter)
		button.layer.cornerRadius = 0.5 * button.bounds.size.width
		button.clipsToBounds = true
		button.backgroundColor = .systemGreen
		button.tintColor = .white
		let imageName = audioFile.name == player.currentlyPlaying ? pauseButtonImageName : playButtonImageName
		button.setImage(UIImage(systemName: imageName), for: .normal)
		button.addTarget(self, action: #selector(playPause), for: .touchUpInside)

		view.addSubview(button)

		// Auto Layout
		button.setupAutoLayout()
		button.constrainHeight(to: buttonDiameter)
		button.constrainWidth(to: buttonDiameter)
		button.constrainCenterX(to: view.centerXAnchor)
		button.constrainBottom(to: view.bottomAnchor, offset: -100)
	}
}

// MARK: - Actions
extension PlayerViewController {
	@objc func playPause() {
		// Check if the audio file is currently playing.
		// If so, this function should pause the current song.
		// Otherwise, this function should play the current song.
		// On pause or successful play, toggle the button icon.
		if audioFile.name == player.currentlyPlaying {
			button.setImage(UIImage(systemName: playButtonImageName), for: .normal)
			player.pause()
			playerDelegate.didStopPlaying(id: audioFile.id)
		} else {
			let isPlaying = player.play(sound: audioFile.name)

			if isPlaying {
				button.setImage(UIImage(systemName: pauseButtonImageName), for: .normal)
				playerDelegate.didStartPlaying(id: audioFile.id)
			}
		}
	}
}
