//
//  MultipleSelectViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 09/01/17.
//  Copyright © 2017 Kayako. All rights reserved.
//

import AsyncDisplayKit

public struct SelectableOption {
	var selectionState: SelectionState
	let id: Int
	let text: String
}

prefix operator !

prefix func ! ( selectionState: inout SelectionState) {
	selectionState = (selectionState == .selected) ? .notSelected : .selected
}


class MultipleSelectViewController: UIViewController, ASTableDataSource, ASTableDelegate {

	let tableNode = ASTableNode()
	
	var options: [SelectableOption] = Array(1...10).map{ SelectableOption(selectionState: .notSelected, id: $0, text: "Option \($0)") }
	
	let navigationBar = UINavigationBar()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.addSubnode(tableNode)
		tableNode.delegate = self
		tableNode.dataSource = self
		self.edgesForExtendedLayout = [.left, .right, .bottom]
		
		
		
		let navigationItem = UINavigationItem()
		
		let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(MultipleSelectViewController.saveButtonTapped))
		let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(MultipleSelectViewController.cancelButtonTapped))
		navigationItem.leftBarButtonItem = saveButton
		navigationItem.rightBarButtonItem = cancelButton
		
		navigationBar.items = [navigationItem]
		self.view.addSubview(navigationBar)
        // Do any additional setup after loading the view.
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height - 44)
		navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
	}
	
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return options.count
	}
	
	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		!options[indexPath.row].selectionState
		tableNode.reloadRows(at: [indexPath], with: .none)
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		let node = SelectableCellNode(text: options[indexPath.row].text, state: options[indexPath.row].selectionState)
		return node
	}
	
	func saveButtonTapped() {
	}
	
	func cancelButtonTapped() {
	}
}
