//
//  SoundTableViewCell.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import UIKit

final class SoundTableViewCell: UITableViewCell {

	// MARK: - UI Elements
	let playingIndicator = PlayingIndicator(frame: .zero)
	let nameLabel = UILabel(frame: .zero)

	// MARK: - UI Constants
	private let padding: CGFloat = 15.0
	private let multiplier: CGFloat = 0.4
	private let textSize: CGFloat = 16.0

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		addPlayingIndicator()
		addNameLabel()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - Add child views
extension SoundTableViewCell {

	private func addPlayingIndicator() {
		contentView.addSubview(playingIndicator)

		// Auto Layout
		playingIndicator.setupAutoLayout()
		playingIndicator.constrainLeadingEdge(to: leadingAnchor, offset: padding)
		playingIndicator.constrainCenterY(to: centerYAnchor)
		playingIndicator.constrainToSquareAspectRatio(to: heightAnchor, multiplier: multiplier)
	}

	private func addNameLabel() {
		// Modify label properties
		nameLabel.font = .boldSystemFont(ofSize: textSize)

		contentView.addSubview(nameLabel)

		// Auto Layout
		nameLabel.setupAutoLayout()
		nameLabel.constrainLeadingEdge(to: playingIndicator.trailingAnchor, offset: padding)
		nameLabel.constrainTrailingEdge(to: trailingAnchor, offset: -padding)
		nameLabel.constrainHeight(to: bounds.height)
		nameLabel.constrainCenterY(to: centerYAnchor)
	}

}
