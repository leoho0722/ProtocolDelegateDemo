//
//  CustomTabBarView2.swift
//  ProtocolDelegateDemo
//
//  Created by Leo Ho on 2022/4/11.
//

import UIKit

class CustomTabBarView: UIView {
    
    @IBOutlet weak var left: CustomTabBarItem!
    @IBOutlet weak var mid: CustomTabBarItem!
    @IBOutlet weak var right: CustomTabBarItem!
    
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
        left.setInit(iconImage: UIImage(systemName: "applelogo"),
                     iconImageTintColor: .red,
                     iconImageContentMode: .scaleAspectFit,
                     labelText: "Apple Logo",
                     labelTextTintColor: .red,
                     labelTextFontStyle: .normal,
                     labelTextFontSize: 20,
                     viewBackgroundColor: .white,
                     buttonTag: 0,
                     delegate: self)
    }
    
    func setInitMidTabBarItem() {
        mid.setInit(iconImage: UIImage(systemName: "macpro.gen3.fill"),
                    iconImageTintColor: .green,
                    iconImageContentMode: .scaleAspectFit,
                    labelText: "Mac Pro 2019",
                    labelTextTintColor: .green,
                    labelTextFontStyle: .bold,
                    labelTextFontSize: 20,
                    viewBackgroundColor: .white,
                    buttonTag: 1,
                    delegate: self)
    }
    
    func setInitRightTabBarItem() {
        right.setInit(iconImage: UIImage(systemName: "airpodspro"),
                      iconImageTintColor: .blue,
                      iconImageContentMode: .scaleAspectFit,
                      labelText: "AirPods Pro",
                      labelTextTintColor: .blue,
                      labelTextFontStyle: .italic,
                      labelTextFontSize: 20,
                      viewBackgroundColor: .white,
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
