//
//  SelectableCellNode.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 09/01/17.
//  Copyright © 2017 Kayako. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

public enum SelectionState {
	case selected
	case notSelected
}

class SelectableCellNode: ASCellNode {
	var tickIcon: ASImageNode?
	let textNode = ASTextNode()
	var selectionState: SelectionState
	
	init(text: String, state: SelectionState) {
		self.selectionState = state
		super.init()
		
		self.addSubnode(textNode)
		textNode.attributedText = NSAttributedString(string: text, attributes: TextStyles.shared.bodyStyle)
		if selectionState == .selected {
			tickIcon = ASImageNode()
			tickIcon.flatMap {
				self.addSubnode($0)
				$0.image = #imageLiteral(resourceName: "Tick")
				$0.style.width = ASDimensionMake(22)
				$0.style.height = ASDimensionMake(16)
			}
		}
		
		textNode.style.flexGrow = 1.0
	}
	
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let nodes: [ASLayoutElement?] = [textNode, tickIcon]
		let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 0.0, justifyContent: .start, alignItems: .stretch, children: nodes.flatMap{$0})
		return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(18, 9, 9, 9), child: stack)
	}
	
}
