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
//		node.backgroundColor = UIColor.red
		let searchText = IconTextNode()
		node.addSubnode(searchText)
//		searchText.backgroundColor = UIColor.green
		searchText.layout()
		node.layoutSpecBlock = {
			size in
			searchText.style.maxWidth = ASDimensionMake("100%")
			return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: [], child: searchText)
		}
		
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
