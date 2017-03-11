//
//  HomeViewController.swift
//  MenuDiffusion
//
//  Created by don chen on 2017/3/11.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.layer.cornerRadius = 20
    }
    
    @IBAction func didTapMenu(_ sender: Any) {
        let menuVC = MenuViewController(nibName: "MenuViewController", bundle: nil)
        
        let NC = UINavigationController(rootViewController: menuVC)
        NC.navigationBar.isHidden = true
        NC.modalPresentationStyle = .custom
        NC.modalTransitionStyle = .crossDissolve
        present(NC, animated: true, completion: nil)
    }
    
}
