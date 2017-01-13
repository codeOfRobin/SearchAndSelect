//
//  SingleSelectViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 13/01/17.
//  Copyright © 2017 Kayako. All rights reserved.
//

import AsyncDisplayKit

protocol SingleSelectDelegate: class {
	func optionWasSelected(at row: Int)
}

class SingleSelectViewController: UIViewController, ASTableDelegate, ASTableDataSource {

	let tableNode = ASTableNode()
	let options: [String] = Array(1...10).map{ "Option \($0)" }
	let navigationBar = UINavigationBar()
	
	var state: DropdownState = .closed
	
	weak var delegate: SingleSelectDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

		tableNode.delegate = self
		tableNode.dataSource = self
    }
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return options.count
	}

	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		delegate?.optionWasSelected(at: indexPath.row)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableNode.frame = CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height - 44)
		navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
	}
}
