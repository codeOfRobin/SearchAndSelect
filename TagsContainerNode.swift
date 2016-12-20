//
//  TagsContainerNode.swift
//  SearchAndSelect
//
//  Created by Robin Malhotra on 20/12/16.
//  Copyright © 2016 Kayako. All rights reserved.
//

import AsyncDisplayKit

open class TagsContainerNode: ASCellNode, ASCollectionDataSource, ASCollectionDelegate, ASCollectionViewDelegateFlowLayout {
	
	public var collectionNode = ASCollectionNode()
	
	public override init() {
		super.init()
		
		let flowlayout = UICollectionViewFlowLayout.init()
		flowlayout.scrollDirection = .vertical
		flowlayout.minimumInteritemSpacing = 0;
		flowlayout.minimumLineSpacing = 0
//		 Shouldn't this be done automatically?  as per documentation ? remove this and it does not show cells.
		flowlayout.itemSize = CGSize.init(width: 100, height: 100)
		collectionNode = ASCollectionNode(collectionViewLayout: flowlayout)
		
		
		collectionNode.dataSource = self
		collectionNode.delegate = self
		addSubnode(collectionNode)
		collectionNode.backgroundColor = UIColor.red
		
	}
	
	let tags = [TagNode(tagText: "DSL"),TagNode(tagText: "Reddit"),TagNode(tagText: "Facebook"),TagNode(tagText: "Twitter"),TagNode(tagText: "Internet"), TagNode(tagText: "Your mom")]
	
	public func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
		return 1
	}
	
	public func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
		return tags.count
	}
	
	public func collectionNode(_ collectionNode: ASCollectionNode, nodeForItemAt indexPath: IndexPath) -> ASCellNode {
		return tags[indexPath.row]
	}
	
	open override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		collectionNode.style.height = ASDimensionMake(100)
		collectionNode.style.height = ASDimensionMake(100)
		collectionNode.style.flexGrow = 1.0
		return ASStackLayoutSpec(direction: .horizontal, spacing: 0.0, justifyContent: .center, alignItems: .stretch, children: [collectionNode])
	}
}

