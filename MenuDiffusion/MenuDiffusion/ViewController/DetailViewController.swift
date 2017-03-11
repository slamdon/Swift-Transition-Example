//
//  DetailViewController.swift
//  MenuDiffusion
//
//  Created by don chen on 2017/3/11.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var closeButton: UIButton!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var centerImageView: UIImageView!
    
    var backgroundColor = UIColor.white
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        backgroundView.backgroundColor = backgroundColor
        centerImageView.image = UIImage(named: imageName)
        
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    

}
