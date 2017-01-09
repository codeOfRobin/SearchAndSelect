//
//  IconTextNode.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 19/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit

public enum SearchTextState {
	case closed
	case open
	case searching
}

open class IconTextNode: ASDisplayNode, ASEditableTextNodeDelegate {
	
	public let icon = ASImageNode()
	public let textNode = ASEditableTextNode()
	let container = ASDisplayNode()
	let bottomSeparator = ASDisplayNode()
	let topSeparator = ASDisplayNode()
	
	public var searchTextState: SearchTextState = .closed {
		didSet {
			if searchTextState == .searching {
				(indicator.view as? UIActivityIndicatorView).flatMap{
					$0.startAnimating()
				}
			} else {
				(indicator.view as? UIActivityIndicatorView).flatMap{
					$0.stopAnimating()
				}
			}
			self.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
			
		}
	}
	
	let indicator = ASDisplayNode { () -> UIView in
		let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
		indicator.hidesWhenStopped = true
		return indicator
	}
	
	public override init() {
		super.init()
		
		self.automaticallyManagesSubnodes = true
		icon.image = UIImage(named: "search")
		addSubnode(icon)
		addSubnode(textNode)
		addSubnode(topSeparator)
		addSubnode(bottomSeparator)
		textNode.delegate = self
		
		self.backgroundColor = Colors.shared.searchBackground
		textNode.attributedPlaceholderText = NSAttributedString(string: "Previous Value", attributes: TextStyles.shared.placeholderStyle)
		textNode.typingAttributes = TextStyles.shared.bodyStyle
		
		topSeparator.backgroundColor = Colors.shared.separatorColor
		bottomSeparator.backgroundColor = Colors.shared.separatorColor
		
		icon.style.height = ASDimensionMake(20.0)
		icon.style.width = ASDimensionMake(20.0)
		indicator.style.height = ASDimensionMake(20.0)
		indicator.style.width = ASDimensionMake(20.0)
		
		topSeparator.style.height = ASDimensionMake(1.0)
		bottomSeparator.style.height = ASDimensionMake(1.0)
		
	}

	
	open override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		textNode.style.flexGrow = 1.0
		topSeparator.style.flexGrow = 1.0
		bottomSeparator.style.flexGrow = 1.0
		
		var children: [ASLayoutElement] = []
		
		switch searchTextState {
		case .closed:
			children = [textNode]
		case .open:
			children = [icon, textNode]
		case .searching:
			children = [indicator, textNode]
		}
		
		let insetted = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(15, 15, 15, 15), child: ASStackLayoutSpec(direction: .horizontal, spacing: 13.0, justifyContent: .start, alignItems: .stretch, children: children))
		
		return ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [topSeparator, insetted, bottomSeparator])
	}
	
}
