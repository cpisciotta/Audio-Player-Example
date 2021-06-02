//
//  PlayingIndicator.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import UIKit

final class PlayingIndicator: UIView {
	var isPlaying: Bool {
		didSet {
			if isPlaying {
				backgroundColor = .systemGreen
				layer.borderColor = UIColor.systemGreen.cgColor
			} else {
				backgroundColor = .clear
				layer.borderColor = UIColor.gray.cgColor
			}
		}
	}

	override init(frame: CGRect) {
		self.isPlaying = false
		super.init(frame: frame)

		backgroundColor = .clear
		layer.borderWidth = 1.0
		layer.borderColor = UIColor.gray.cgColor
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		layer.cornerRadius = bounds.width / 2
	}
}
