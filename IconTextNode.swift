//
//  IconTextNode.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 19/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit

enum searchState {
	
}

open class IconTextNode: ASDisplayNode, ASEditableTextNodeDelegate {
	
	var icon = ASImageNode()
	let textNode = ASEditableTextNode()
	
	public override init() {
		super.init()
		icon.image = #imageLiteral(resourceName: "search")
		addSubnode(icon)
		addSubnode(textNode)
		textNode.delegate = self
		textNode.attributedPlaceholderText = NSAttributedString(string: "Really long ksdaNIUadsiusdahiudsahsadhuIUasduisdaUIHASDIUHdasuiuihasd")
	}
	
	public func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
		self.invalidateCalculatedLayout()
		self.setNeedsLayout()
	}
	
//	open override func calculateSizeThatFits(_ constrainedSize: CGSize) -> CGSize {
//		let imageSize = icon.layoutThatFits(ASSizeRangeMake(CGSize.zero, constrainedSize)).size
//		let maxTextSize = CGSize(width: constrainedSize.width - imageSize.width, height: constrainedSize.height)
//		let textSize = textNode.layoutThatFits(ASSizeRangeMake(CGSize.zero, maxTextSize)).size
//		
//		let minHeight = max(imageSize.height, textSize.height)
//		return CGSize(width: constrainedSize.width, height: minHeight)
//	}
//	
//	
//	open override func layout() {
//		let imageSize = icon.calculatedSize
//		icon.frame = CGRect(x: bounds.size.width - imageSize.width, y: 0.0, width: imageSize.width, height: imageSize.height)
//		
//		let textSize = textNode.calculatedSize
//		textNode.frame = CGRect(origin: .zero, size: textSize)
//	}
	
	open override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		textNode.style.flexShrink = 1.0
		icon.style.height = ASDimensionMake(20.0)
		icon.style.width = ASDimensionMake(20.0)
		
		
		return ASStackLayoutSpec(direction: .horizontal, spacing: 13.0, justifyContent: .spaceBetween, alignItems: .stretch, children: [textNode, icon])
	}
}
