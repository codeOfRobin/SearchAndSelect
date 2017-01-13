//
//  TestingViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 13/01/17.
//  Copyright © 2017 Kayako. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TestingViewController: UIViewController, SingleSelectDelegate, ASTableDataSource, ASTableDelegate {

	let tableNode = ASTableNode()
	let options = Array(1...10).map{ "Option \($0)" }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubnode(tableNode)
		tableNode.delegate = self
		tableNode.dataSource = self
		
    }
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		return SingleSelectNode(headerText: "something", options: options, currentValue: "Option 1")
	}
	
	func optionWasSelected(at row: Int) {
		print(row)
	}
	
	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		if let node = tableNode.nodeForRow(at: indexPath) as? SingleSelectNode {
			node.open()
			tableNode.deselectRow(at: indexPath, animated: true)
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height - 44)
	}

}
