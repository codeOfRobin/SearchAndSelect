//
//  TextViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 19/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import SearchAndSelect
import AsyncDisplayKit

class TextViewController: UIViewController {

	let node = ASDisplayNode()
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubnode(node)
		let searchText = IconTextNode()
		node.addSubnode(searchText)
		searchText.layout()
		node.layoutSpecBlock = {
			size in
			return ASStackLayoutSpec(direction: .vertical, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [searchText])
		}
		
//		let first = DispatchTime.now() + .seconds(3)
//		let second = DispatchTime.now() + .seconds(10)
//		
//		DispatchQueue.main.asyncAfter(deadline: first) { 
//			searchText.searchTextState = .open
//		}
//		
//		DispatchQueue.main.asyncAfter(deadline: second) {
//			searchText.searchTextState = .searching
//		}
        // Do any additional setup after loading the view.
    }

	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewDidLayoutSubviews() {
		node.frame = view.frame
	}
	
}
