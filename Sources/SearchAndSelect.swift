/**
 *  SearchAndSelect
 *
 *  Copyright (c) 2016 Robin Malhotra. Licensed under the MIT license
 */

import AsyncDisplayKit


public protocol SearchAndSelectDelegate {
	func node(forRowAt indexPath: IndexPath) -> ASCellNode
	func numberOfSections() -> Int
	func numberOfRows(in section: Int) -> Int
	func searchTextDidUpdate(withText text: String)
	func didSelectSuggestion(atIndexPath indexPath: IndexPath)
}

public enum SearchState {
	case closed
	case open
}

open class SearchAndSelectNode: ASDisplayNode, ASTableDataSource, ASTableDelegate, ASEditableTextNodeDelegate {
	
	public var delegate: SearchAndSelectDelegate?
	public var state: SearchState = .closed
	
	public let textField = ASEditableTextNode()
	public let tableNode = ASTableNode()
	
	override public init() {
		super.init()
		
		self.addSubnode(textField)
		self.addSubnode(tableNode)
		
		tableNode.delegate = self
		tableNode.dataSource = self
		
		textField.attributedPlaceholderText = NSAttributedString(string: "Search")
		textField.delegate = self
	}
	
	open func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
		delegate?.searchTextDidUpdate(withText: editableTextNode.textView.text)
	}
	
	
	open func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return delegate?.numberOfRows(in: section) ?? 0
	}
	
	open func numberOfSections(in tableNode: ASTableNode) -> Int {
		return delegate?.numberOfSections() ?? 0
	}
	
	open func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
		let text = ASTextCellNode()
		text.text = "dsafdfsdfas"
		return delegate?.node(forRowAt: indexPath) ?? text
	}
	
	public func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		delegate?.didSelectSuggestion(atIndexPath: indexPath)
	}
	
	override open func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		switch state {
		case .closed:
			return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(18, 9, 18, 9), child: textField)
		case .open:
			tableNode.style.flexGrow = 1.0
			textField.style.flexShrink = 1.0
			let stack = ASStackLayoutSpec(direction: .vertical, spacing: 9.0, justifyContent: .start, alignItems: .stretch, children: [textField, tableNode])
			return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(18, 9, 18, 9), child: stack)
		}
	}
}
