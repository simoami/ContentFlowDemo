//
//  ASDKViewController.swift
//  ViewBlockDefectDemo
//
//  Created by Work on 10/4/16.
//  Copyright © 2016 Golets. All rights reserved.
//

import AsyncDisplayKit

class ASDKViewController: ASViewController {
    
    convenience init() {
        self.init(node: RootNode())
    }
}

class RootNode: ASScrollNode {
    
    let profileImage: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "profile-bg")
        node.style.height = ASDimensionMake(200)
        return node
    }()
    
    let statsBlock: ASTextNode = {
        let node = ASTextNode()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        node.attributedText = NSAttributedString(string: "STATS PLACEHOLDER", attributes: [
            NSParagraphStyleAttributeName: paragraphStyle
        ])
        node.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        node.backgroundColor = UIColor(white: 0.7, alpha: 1)
        return node
    }()

    let actionsBlock: ASTextNode = {
        let node = ASTextNode()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        node.attributedText = NSAttributedString(string: "ACTIONS PLACEHOLDER", attributes: [
            NSParagraphStyleAttributeName: paragraphStyle
            ])
        node.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        node.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return node
    }()
    
    let profileTabs = ProfileTabs()

    override init() {
        super.init()
        view.alwaysBounceVertical = true
        backgroundColor = UIColor.whiteColor()
        
        addSubnode(profileImage)
        addSubnode(statsBlock)
        addSubnode(actionsBlock)
        addSubnode(profileTabs)
    }
    
    override func layout() {
        super.layout()
        // set scrollview height based on inner content
        let size = layoutThatFits(ASSizeRangeMake(CGSizeZero, CGSize(width: bounds.width, height: CGFloat.max))).size
        view.contentSize = size
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec.verticalStackLayoutSpec()
        stack.alignItems = .Stretch
        stack.children = [profileImage, statsBlock, actionsBlock, profileTabs]
        return stack
    }
}
