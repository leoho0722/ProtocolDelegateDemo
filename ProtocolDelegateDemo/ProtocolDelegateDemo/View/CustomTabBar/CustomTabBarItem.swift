//
//  CustomTabBarItem.swift
//  ProtocolDelegateDemo
//
//  Created by Leo Ho on 2022/4/11.
//

import UIKit

class CustomTabBarItem: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var delegate: CustomTabBarItemDelegate?
        
    override func awakeFromNib() {
        addXibView()
        button.setTitle("", for: .normal)
    }
    
    // view 在設計時想要看到畫面要用這個
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addXibView()
    }
    
    func setInit(iconImage: UIImage?,
                 iconImageTintColor: UIColor,
                 iconImageContentMode: UIImageView.ContentMode,
                 labelText: String?,
                 labelTextTintColor: UIColor,
                 labelTextFontStyle: SystemFontStyle,
                 labelTextFontSize: CGFloat,
                 viewBackgroundColor: UIColor,
                 buttonTag: Int,
                 delegate: CustomTabBarItemDelegate) {
        setImageView(icon: iconImage, tintColor: iconImageTintColor, imageContentMode: iconImageContentMode)
        setLabel(title: labelText, textTintColor: labelTextTintColor, fontStyle: labelTextFontStyle, fontSize: labelTextFontSize)
        setBackgroundView(backgroundColor: viewBackgroundColor)
        setButton(tag: buttonTag)
        self.delegate = delegate
    }
    
    private func setImageView(icon: UIImage?, tintColor: UIColor, imageContentMode: UIImageView.ContentMode = .scaleAspectFit) {
        imageView.image = icon
        imageView.tintColor = tintColor
        imageView.contentMode = imageContentMode
    }
    
    private func setLabel(title: String?, textTintColor: UIColor, fontStyle: SystemFontStyle, fontSize: CGFloat) {
        label.text = title
        label.textColor = textTintColor
        label.font = chooseSystemFontStyle(systemFontStyle: fontStyle, fontSize: fontSize)
    }
    
    private func setBackgroundView(backgroundColor: UIColor) {
        backgroundView.backgroundColor = backgroundColor
    }
    
    private func setButton(tag: Int) {
        button.tag = tag
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
