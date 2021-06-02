//
//  AutoLayout+Ext.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import UIKit

extension UIView {

	/// Enables Programmatic Auto Layout
	func setupAutoLayout() {
		self.translatesAutoresizingMaskIntoConstraints = false
	}

	/// Enables a `leadingAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutXAxisAnchor of the other view.
	///   - offset: The horizontal offset the view should have from its parent. Default is 0.0.
	func constrainLeadingEdge(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0) {
		self.leadingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables a `trailingAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutXAxisAnchor of the other view.
	///   - offset: The horizontal offset the view should have from its parent. Default is 0.0.
	func constrainTrailingEdge(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0) {
		self.trailingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables a `topAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutYAxisAnchor of the other view.
	///   - offset: The vertical offset the view should have from its parent. Default is 0.0.
	func constrainTop(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0) {
		self.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables a `bottomAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutYAxisAnchor of the other view.
	///   - offset: The vertical offset the view should have from its parent. Default is 0.0.
	func constrainBottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0) {
		self.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables a `centerXAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutYAxisAnchor of the other view.
	///   - offset: The horizontal offset the view should have from its parent's `centerXAnchor`.
	func constrainCenterX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0.0) {
		self.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables a `centerYAnchor` constraint of a view.
	/// - Parameters:
	///   - anchor: The NSLayoutYAxisAnchor of the other view.
	///   - offset: The vertical offset the view should have from its parent's `centerYAnchor`.
	func constrainCenterY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0.0) {
		self.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
	}

	/// Enables the constraints associated with height and width to maintain 1:1 aspect ratio.
	/// - Parameters:
	///   - dimension: The constraining dimension of the other view.
	///   - multiplier: The multiplier constant for the constraint.
	func constrainToSquareAspectRatio(to dimension: NSLayoutDimension, multiplier: CGFloat) {
		self.heightAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
		self.widthAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
	}

	/// Enables the `heightAnchor` constraint of a view.
	/// - Parameters:
	///   - dimension: The dimension constraint of the view.
	///   - multiplier: The multiplier constant of the constraint.
	func constrainHeight(to dimension: CGFloat, multiplier: CGFloat = 1.0) {
		self.heightAnchor.constraint(equalToConstant: dimension).isActive = true
	}

	/// Enables the `widthAnchor` constraint of a view.
	/// - Parameters:
	///   - dimension: The dimension constraint of the view.
	///   - multiplier: The multiplier constant of the constraint.
	func constrainWidth(to dimension: CGFloat, multiplier: CGFloat = 1.0) {
		self.widthAnchor.constraint(equalToConstant: dimension).isActive = true
	}

	func constrainAsFullSize(to view: UIView) {
		self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}

}
