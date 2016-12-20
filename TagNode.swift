//
//  TagNode.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 20/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit

public protocol DeleteTagDelegate {
	func deleteButtonTapped()
}

open class TagNode: ASCellNode {
	
	let crossButton = ASButtonNode()
	let tagTextNode = ASTextNode()
	
	var delegate: DeleteTagDelegate?
	
	let tagText: String
	
	public init(tagText: String) {
		self.tagText = tagText
		super.init()
		
		addSubnode(tagTextNode)
		addSubnode(crossButton)
		
		crossButton.setTitle("X", with: nil, with: UIColor.gray, for: [])
		crossButton.contentVerticalAlignment = .alignmentCenter
		crossButton.contentHorizontalAlignment = .horizontalAlignmentMiddle
		
		tagTextNode.attributedText = NSAttributedString(string: tagText, attributes: TextStyles.shared.bodyStyle)
		
		self.backgroundColor = Colors.shared.searchBackground
	}
	
	override open func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		crossButton.style.flexGrow = 1.0
		tagTextNode.style.flexGrow = 1.0
		return ASStackLayoutSpec(direction: .horizontal, spacing: 5.0, justifyContent: .center, alignItems: .center, children: [tagTextNode, crossButton])
	}
}
