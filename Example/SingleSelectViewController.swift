//
//  SingleSelectViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 13/01/17.
//  Copyright © 2017 Kayako. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

protocol SingleSelectDelegate: class {
	func optionWasSelected(at row: Int)
}

class SingleSelectNode: ASCellNode, ASTableDelegate, ASTableDataSource {

	let tableNode = ASTableNode()
	let headerNode: HeaderTextNode
	let valueNode = ASTextNode()
	var options: [String]
	var currentValue: String?
	
	var state: DropdownState = .closed
	
	weak var delegate: SingleSelectDelegate?

	init(headerText: String, options: [String], currentValue: String?) {
		self.headerNode = HeaderTextNode(headerText: headerText)
		self.options = Array(1...10).map{ "Option \($0)" }
		self.currentValue = currentValue
		super.init()
		tableNode.delegate = self
		tableNode.dataSource = self
		
		
		tableNode.style.height = ASDimensionMake(300)
		self.addSubnode(headerNode)
		valueNode.attributedText = NSAttributedString(string: currentValue ?? "-", attributes: TextStyles.shared.bodyStyle)
		self.addSubnode(valueNode)
		self.addSubnode(tableNode)
	}
	
	func numberOfSections(in tableNode: ASTableNode) -> Int {
		return 1
	}
	
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return options.count
	}

	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		self.state = .closed
		self.valueNode.attributedText = NSAttributedString(string: options[indexPath.row], attributes: TextStyles.shared.bodyStyle)
		delegate?.optionWasSelected(at: indexPath.row)
		self.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		return {
			let textNode = ASTextCellNode()
			textNode.text = options[indexPath.row]
			return textNode
		}()
	}
	
	func open() {
		self.state = .open
		self.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let stack: ASStackLayoutSpec = {
			switch self.state{
			//: Pun!
			case .closed:
				return ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [headerNode, valueNode])
			case .open:
				return ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [headerNode, tableNode])
			}
		}()
		
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(9, 18, 9, 9), child: stack)
	}
	
}
