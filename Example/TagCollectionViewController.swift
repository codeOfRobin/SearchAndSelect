//
//  TagCollectionViewController.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 20/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit
import SearchAndSelect

class TagCollectionViewController: UIViewController {

	let collectionNode = TagsContainerNode()
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubnode(collectionNode)
		collectionNode.collectionNode.reloadData()
        // Do any additional setup after loading the view.
    }
	
	override func viewDidLayoutSubviews() {
		collectionNode.frame = view.frame
	}

}
