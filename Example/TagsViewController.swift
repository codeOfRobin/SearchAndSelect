//
//  TagsViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 20/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

class TagsViewController: UIViewController, ASTableDataSource, ASTableDelegate {

	let tableNode = ASTableNode()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubnode(tableNode)
		tableNode.dataSource = self
		tableNode.delegate = self
    }
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
//		if indexPath.row == 3 {
//			let tagContainer = TagsContainerNode()
//			return tagContainer
//		} else {
//			let textCell = ASTextCellNode()
//			textCell.text = "\(indexPath.section). \(indexPath.row)"
//			return textCell
//		}
		
		return TagNode(tagText: "\(indexPath.section). \(indexPath.row)")
	}
	
	
	override func viewDidLayoutSubviews() {
		tableNode.frame = view.frame
	}

}
