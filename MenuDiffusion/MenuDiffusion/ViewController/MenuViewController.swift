//
//  MenuViewController.swift
//  MenuDiffusion
//
//  Created by don chen on 2017/3/11.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var yellowView: UIView!
    @IBOutlet var blueView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var redView: UIView!
    
    let transition = SKDiffusionTransition()
    var selectedView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        
        // custom navigation trnasition
        navigationController?.delegate = self

    }
    
    override func viewDidLayoutSubviews() {
        yellowView.layer.cornerRadius = yellowView.frame.width/2
        blueView.layer.cornerRadius   = blueView.frame.width/2
        greenView.layer.cornerRadius  = greenView.frame.width/2
        redView.layer.cornerRadius    = redView.frame.width/2
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapYellow(_ sender: Any) {
        selectedView = yellowView
        
        let color = UIColor(red: 1, green: 198/255, blue: 93/255, alpha: 1)
        pushDetailViewController(backgroundColor: color, imageName: "egg")
        
    }
    
    @IBAction func didTapBlue(_ sender: Any) {
        selectedView = blueView
        
        let color = UIColor(red: 76/255, green: 195/255, blue: 217/255, alpha: 1)
        pushDetailViewController(backgroundColor: color, imageName: "chicken")
    }
    
    @IBAction func didTapGreen(_ sender: Any) {
        selectedView = greenView
        
        let color = UIColor(red: 123/255, green: 200/255, blue: 164/255, alpha: 1)
        pushDetailViewController(backgroundColor: color, imageName: "coffee")
    }
    
    @IBAction func didTapRed(_ sender: Any) {
        selectedView = redView
        
        let color = UIColor(red: 241/255, green: 103/255, blue: 69/255, alpha: 1)
        pushDetailViewController(backgroundColor: color, imageName: "fish")
    }
    
    fileprivate func pushDetailViewController(backgroundColor:UIColor, imageName:String) {
        let VC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        VC.backgroundColor = backgroundColor
        VC.imageName = imageName
        
        VC.modalTransitionStyle = .crossDissolve
        VC.modalPresentationStyle = .custom
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
}

// MARK: UINavigationControllerDelegate
extension MenuViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if selectedView != nil {
            transition.selectedView = selectedView!
        }
        
        if fromVC is MenuViewController {
            transition.isPush = true
        } else {
            transition.isPush = false
        }
        
        return transition
    }
}
