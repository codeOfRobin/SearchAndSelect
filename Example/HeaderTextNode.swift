
//
//  HeaderTextNode.swift
//  CustomFieldsPrototpying
//
//  Created by Robin Malhotra on 04/01/17.
//  Copyright © 2017 Robin Malhotra. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

class HeaderTextNode: ASTextNode {
	
	init(headerText: String) {
		super.init()
		setText(text: headerText)
	}
	
	func setText(text: String) {
		self.attributedText = NSAttributedString(string: text, attributes: TextStyles.shared.placeholderStyle)
	}
}
