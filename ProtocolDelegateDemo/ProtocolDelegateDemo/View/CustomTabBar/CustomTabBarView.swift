//
//  CustomTabBarView.swift
//  ProtocolDelegateDemo
//
//  Created by Leo Ho on 2022/4/10.
//

import UIKit

class CustomTabBarView: UIView {
    
    @IBOutlet weak var leftTabBarItem: CustomTabBarItem!
    @IBOutlet weak var midTabBarItem: CustomTabBarItem!
    @IBOutlet weak var rightTabBarItem: CustomTabBarItem!
    
    override func awakeFromNib() {
        addXibView()
    }
    
    // view 在設計時想要看到畫面要用這個
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addXibView()
    }
    
    func setInit() {
        setInitLeftTabBarItem()
        setInitMidTabBarItem()
        setInitRightTabBarItem()
    }
    
    func setInitLeftTabBarItem() {
        leftTabBarItem.setInit(viewBackgroundColor: .clear,
                               itemIconImage: UIImage(systemName: "applelogo"),
                               itemIconImageTintColor: .red,
                               imageContentMode: .scaleAspectFit,
                               buttonText: "Apple Logo",
                               buttonTextTintColor: .red,
                               buttonTextFontStyle: .normal,
                               buttonTextFontSize: 20,
                               buttonTag: 0,
                               delegate: self)
    }
    
    func setInitMidTabBarItem() {
        midTabBarItem.setInit(viewBackgroundColor: .clear,
                              itemIconImage: UIImage(systemName: "macpro.gen3.fill"),
                              itemIconImageTintColor: .green,
                              imageContentMode: .scaleAspectFit,
                              buttonText: "Mac Pro 2019",
                              buttonTextTintColor: .green,
                              buttonTextFontStyle: .bold,
                              buttonTextFontSize: 20,
                              buttonTag: 1,
                              delegate: self)
    }
    
    func setInitRightTabBarItem() {
        rightTabBarItem.setInit(viewBackgroundColor: .clear,
                                itemIconImage: UIImage(systemName: "airpodspro"),
                                itemIconImageTintColor: .blue,
                                imageContentMode: .scaleAspectFit,
                                buttonText: "AirPods Pro",
                                buttonTextTintColor: .blue,
                                buttonTextFontStyle: .italic,
                                buttonTextFontSize: 20,
                                buttonTag: 2,
                                delegate: self)
    }
}

fileprivate extension CustomTabBarView {
    // 加入畫面
    func addXibView() {
        if let loadView = Bundle(for: CustomTabBarView.self).loadNibNamed("CustomTabBarView", owner: self, options: nil)?.first as? UIView {
            addSubview(loadView)
            loadView.frame = bounds
        }
    }
}

extension CustomTabBarView: CustomTabBarItemDelegate {
    func target(index: Int) {
        switch index {
        case 0:
            print("button tag: \(index), Apple Logo")
        case 1:
            print("button tag: \(index), Mac Pro 2019")
        case 2:
            print("button tag: \(index), AirPods Pro")
        default:
            break
        }
    }
}
