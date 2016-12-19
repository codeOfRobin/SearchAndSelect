//
//  ViewController.swift
//  Example
//
//  Created by Robin Malhotra on 17/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

class ViewController: UIViewController, SearchAndSelectDelegate {
	
	let searchAndSelect = SearchAndSelectNode()
	
	var suggestions: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubnode(searchAndSelect)
		searchAndSelect.delegate = self
		
		searchAndSelect.tableNode.reloadData()
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	func didSelectSuggestion(atIndexPath indexPath: IndexPath) {
		searchAndSelect.textField.textNode.attributedText = NSAttributedString(string: suggestions[indexPath.row], attributes: TextStyles.shared.bodyStyle)
		self.searchAndSelect.textField.searchTextState = .closed
		self.searchAndSelect.state = .closed
		self.searchAndSelect.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
	}
	
	func searchTextDidUpdate(withText text: String) {
		
		if text == "" {
			self.searchAndSelect.state = .closed
			self.searchAndSelect.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
		} else if searchAndSelect.state == .closed {
			self.searchAndSelect.state = .open
			self.searchAndSelect.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
		}
		suggestions = Array(0..<8).map{"\(text) suggestion \($0)"}
		searchAndSelect.tableNode.reloadData()
	}

	func numberOfSections() -> Int {
		return 1
	}
	
	func node(forRowAt indexPath: IndexPath) -> ASCellNode {
		let cell = ASTextCellNode()
		cell.text = suggestions[indexPath.row]
		return cell
	}
	
	func numberOfRows(in section: Int) -> Int {
		return suggestions.count
	}
	
	override func viewDidLayoutSubviews() {
		searchAndSelect.frame = CGRect(origin: .zero, size: view.frame.size)
	}
}

