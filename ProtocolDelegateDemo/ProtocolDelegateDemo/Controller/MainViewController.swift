//
//  MainViewController.swift
//  ProtocolDelegateDemo
//
//  Created by Leo Ho on 2022/4/10.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var customTabBarView: CustomTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomUI()
    }
    
    func setupCustomUI() {
        customTabBarView.setInit()
    }
}
