//
//  SKDiffusionTransition.swift
//  MenuDiffusion
//
//  Created by don chen on 2017/3/11.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class SKDiffusionTransition:NSObject, UIViewControllerAnimatedTransitioning {
    
    var selectedView = UIView()
    var isPush = true
    
    // animation time
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    // animation script
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // from view
        let fromVC = transitionContext.viewController(forKey: .from)!
        let fromView = fromVC.view!
        
        // to view
        let toVC = transitionContext.viewController(forKey: .to)!
        let toView = toVC.view!
        
        // container view
        let containerView = transitionContext.containerView
        
        if isPush {
            containerView.addSubview(fromView)
            
            toView.frame = selectedView.frame
            toView.clipsToBounds = true
            containerView.addSubview(toView)
            
            UIView.animate(withDuration: 0.2, animations: {
                toView.frame = UIScreen.main.bounds
                
            }, completion: { finished in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(true)
                
            })
        } else {
            let maskView = UIView(frame: fromView.frame)
            maskView.backgroundColor = UIColor.black
            maskView.clipsToBounds = true
            
            containerView.addSubview(toView)
            containerView.addSubview(maskView)
            containerView.addSubview(fromView)
            
            fromView.mask = maskView

            UIView.animate(withDuration: 0.2, animations: {
                maskView.frame = self.selectedView.frame
                maskView.layer.cornerRadius = self.selectedView.frame.width/2
                
            }, completion: { finished in
                // don't know why it will crash
//                maskView.removeFromSuperview()
                
                fromView.removeFromSuperview()
                transitionContext.completeTransition(true)
                
            })
        }


    }
    
    
    
}
