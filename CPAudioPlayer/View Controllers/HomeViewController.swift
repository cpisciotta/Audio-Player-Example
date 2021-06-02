//
//  HomeViewController.swift
//  CPAudioPlayer
//
//  Created by Charles Pisciotta on 6/2/21.
//

import UIKit

final class HomeViewController: UITableViewController {

	// MARK: - String Constants
	private let cellReuseIdentifier = "audioPreviewCell"
	private let vcTitle = "Audio Files"

	// MARK: - Properties
	private let player = CPAudioPlayer.shared
	private let audioFiles: [AudioFile] = AudioFile.getAudioFiles()

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(SoundTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

		title = vcTitle
	}
}

extension HomeViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return audioFiles.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: SoundTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! SoundTableViewCell
		cell.nameLabel.text = audioFiles[indexPath.row].name
		cell.playingIndicator.isPlaying = player.currentlyPlaying == audioFiles[indexPath.row].name
		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 44.0
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		present(getPlayerVC(for: audioFiles[indexPath.row]), animated: true)
	}
}

extension HomeViewController {
	func getPlayerVC(for audioFile: AudioFile) -> PlayerViewController {
		let playerVC = PlayerViewController()
		playerVC.audioFile = audioFile
		playerVC.playerDelegate = self
		return playerVC
	}
}

extension HomeViewController: PlayerDelegate {

	func didStartPlaying(id: Int) {
		// Highlight the player indicator for the audio file that just began playing
		// The array index corresponds to `id - 1`
		(tableView.cellForRow(at: IndexPath(row: id - 1, section: 0)) as! SoundTableViewCell).playingIndicator.isPlaying = true

		// Reload the table to unhighlight any previously playing audio file playing indicator
		// Ideally, this function would pass in the previously playing audio file id to avoid reloading the table, however, only 6 entries exist.
		tableView.reloadData()
	}

	func didStopPlaying(id: Int) {
		// Highlight the player indicator for the audio file that just began playing
		// The array index corresponds to `id - 1`
		(tableView.cellForRow(at: IndexPath(row: id - 1, section: 0)) as! SoundTableViewCell).playingIndicator.isPlaying = false

		// Unhighlight the playing indicator for the previously playing audio file
		tableView.reloadRows(at: [IndexPath(row: id - 1, section: 0)], with: .automatic)
	}
}
