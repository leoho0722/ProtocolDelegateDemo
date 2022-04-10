//
//  CustomFooterButton.swift
//  ProtocolDelegateDemo
//
//  Created by Leo Ho on 2022/4/10.
//

import UIKit

class CustomTabBarItem: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var itemIconImageView: UIImageView!
    @IBOutlet weak var buttonTitleLabel: UILabel!
    @IBOutlet weak var backgroundButton: UIButton!
    
    var delegate: CustomTabBarItemDelegate?
    
    var buttonTags: Int = 0
    
    override func awakeFromNib() {
        addXibView()
    }
    
    // view 在設計時想要看到畫面要用這個
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addXibView()
    }
    
    func setInit(viewBackgroundColor: UIColor,
                 itemIconImage: UIImage?, itemIconImageTintColor: UIColor, imageContentMode: UIImageView.ContentMode,
                 buttonText: String?, buttonTextTintColor: UIColor, buttonTextFontStyle: SystemFontStyle, buttonTextFontSize: CGFloat,
                 buttonTag: Int,
                 delegate: CustomTabBarItemDelegate) {
        setBackgroundView(bgColor: viewBackgroundColor)
        setItemIconImageView(icon: itemIconImage, tintColor: itemIconImageTintColor, imageContentMode: imageContentMode)
        setButtonTitleLabel(buttonTitle: buttonText, buttonTextTintColor: buttonTextTintColor, fontStyle: buttonTextFontStyle, fontSize: buttonTextFontSize)
        setBackgroundButton(btnTag: buttonTag)
        self.buttonTags = buttonTag
        self.delegate = delegate
    }
    
    private func setBackgroundView(bgColor: UIColor) {
        backgroundView.backgroundColor = bgColor
    }
    
    private func setItemIconImageView(icon: UIImage?, tintColor: UIColor, imageContentMode: UIImageView.ContentMode = .scaleAspectFit) {
        itemIconImageView.image = icon
        itemIconImageView.tintColor = tintColor
        itemIconImageView.contentMode = imageContentMode
    }
    
    private func setButtonTitleLabel(buttonTitle: String?, buttonTextTintColor: UIColor, fontStyle: SystemFontStyle, fontSize: CGFloat) {
        buttonTitleLabel.text = buttonTitle
        buttonTitleLabel.textColor = buttonTextTintColor
        buttonTitleLabel.font = chooseSystemFontStyle(systemFontStyle: fontStyle, fontSize: fontSize)
    }
    
    private func setBackgroundButton(btnTag: Int) {
        backgroundButton.tag = btnTag
    }
    
    enum SystemFontStyle {
        case normal
        case bold
        case italic
    }
    func chooseSystemFontStyle(systemFontStyle fontStyle: SystemFontStyle, fontSize: CGFloat) -> UIFont {
        switch fontStyle {
        case .normal:
            return UIFont.systemFont(ofSize: fontSize)
        case .bold:
            return UIFont.boldSystemFont(ofSize: fontSize)
        case .italic:
            return UIFont.italicSystemFont(ofSize: fontSize)
        }
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        delegate?.target(index: sender.tag)
    }
}

fileprivate extension CustomTabBarItem {
    // 加入畫面
    func addXibView() {
        if let loadView = Bundle(for: CustomTabBarItem.self).loadNibNamed("CustomTabBarItem", owner: self, options: nil)?.first as? UIView {
            addSubview(loadView)
            loadView.frame = bounds
        }
    }
}


protocol CustomTabBarItemDelegate {
    func target(index: Int)
}
