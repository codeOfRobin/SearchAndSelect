//
//  File.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 19/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import UIKit

public struct Colors {
	static let shared = Colors()
	
	let separatorColor = UIColor(red:0.82, green:0.84, blue:0.84, alpha:1.00)
	let searchBackground = UIColor(red:0.97, green:0.97, blue:0.98, alpha:1.00)
}


public typealias AttrStringStyles = [String: Any]


public struct TextStyles {
	public static let shared = TextStyles()
	
	public let placeholderStyle: AttrStringStyles = [
		NSForegroundColorAttributeName: UIColor(red:0.63, green:0.67, blue:0.69, alpha:1.00),
		NSFontAttributeName: UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightRegular)
	]
	
	public let bodyStyle: AttrStringStyles = [
		NSForegroundColorAttributeName: UIColor(red:0.23, green:0.25, blue:0.28, alpha:1.00),
		NSFontAttributeName: UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightRegular)
	]
}
