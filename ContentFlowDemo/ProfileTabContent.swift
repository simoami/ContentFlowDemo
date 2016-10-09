//
//  ProfileTabContent.swift
//  ContentFlowDemo
//
//  Created by Simo on 10/9/16.
//  Copyright © 2016 Golets. All rights reserved.
//

import AsyncDisplayKit
import PagingMenuController

class ProfileTabs: ASDisplayNode {

    var pagingMenuController: PagingMenuController?
    var tabBarNode: ASDisplayNode? = nil
    
    override init() {
        super.init()
        
        // PaginMenuController initialization
        let options = PagingMenuOptions()
        pagingMenuController = PagingMenuController(options: options)
        
        // ASDK node view block wrapper for pagingMenuController view
        tabBarNode = TabContentViewNode(view: self.pagingMenuController!.view)
        addSubnode(tabBarNode!)
        
    }

//    override func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
//        return CGSize(width: frame.width, height: 400)
//    }
    
}


// MARK: - ASDK Node wrapper

class TabContentViewNode: ASDisplayNode {
    
    init(view: UIView) {
        super.init(viewBlock: { view }, didLoadBlock: nil)
    }
    
    override func layout() {
        super.layout()
        let size = layoutThatFits(ASSizeRangeMake(CGSizeZero, CGSize(width: self.view.bounds.width, height: CGFloat.max))).size
        var targetFrame = self.frame;
        targetFrame.size.height = size.height;
        self.frame = targetFrame;
    }
}

// MARK: - Pagin Menu options

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    internal var componentType: ComponentType {
        return
            //.MenuView(menuOptions: MenuOptions())
            //.PagingController(pagingControllers: pagingControllers)
            .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    var subControllers: [ASViewController] = []
    
    var viewController1 = FirstController()
    var viewController2 = SecondController()
    
    
    var pagingControllers: [ASViewController] {
        return [viewController1, viewController2]
    }
    
    private struct MenuOptions: MenuViewCustomizable {
        var height: CGFloat {
            return 40
        }
        var animationDuration: NSTimeInterval {
            return 0.15
        }
        var displayMode: MenuDisplayMode {
            return .SegmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [FirstMenuItem(), SecondMenuItem()]
        }
        var focusMode: MenuFocusMode {
            return .Underline(height: 3, color: UIColor.redColor(), horizontalPadding: 0, verticalPadding: 0)
        }
    }
    
    private struct FirstMenuItem: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(
                text: "FIRST CONTROLLER",
                color: UIColor.blackColor(),
                selectedColor: UIColor.blackColor(),
                font: UIFont.systemFontOfSize(12),
                selectedFont: UIFont.systemFontOfSize(12)
            ))
        }
    }
    private struct SecondMenuItem: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(
                text: "SECOND CONTROLLER",
                color: UIColor.blackColor(),
                selectedColor: UIColor.blackColor(),
                font: UIFont.systemFontOfSize(12),
                selectedFont: UIFont.systemFontOfSize(12)
            ))
        }
    }
}


// MARK: - Tab Menu View Controllers

class FirstController: ASViewController {
    init() {
        let node = FirstNode()
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FirstNode : ASDisplayNode {
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "600pt Height")
        return node
    }()
    
    override init() {
        super.init()
        style.height = ASDimensionMake(600)
        addSubnode(titleNode)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .Default, child: titleNode)
    }
}


class SecondController : ASViewController {
    init() {
        let node = SecondNode()
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SecondNode: ASDisplayNode {
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "400pt Height")
        return node
    }()
    
    override init() {
        super.init()
        style.height = ASDimensionMake(400)
        addSubnode(titleNode)
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .Default, child: titleNode)
    }
}
