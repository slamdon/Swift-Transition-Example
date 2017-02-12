//
//  HomeViewController.swift
//  Expand
//
//  Created by don chen on 2017/2/3.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var aTableView: UITableView!
    
    var photos = [String]()
    let transition = SKExpandTransition()
    var selectedCellFrame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Code4idea.com"
        
        let cellNib = UINib(nibName: "SeaCell", bundle: nil)
        aTableView.register(cellNib, forCellReuseIdentifier: "aCell")
        
        for i in 1...12 {
            photos.append("sea\(i)")
        }
        
        self.navigationController?.delegate = self
    }

}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell") as! SeaCell
        if let image = UIImage(named: photos[indexPath.row]) {
            cell.aImageView.image = image
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    
    
}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCellFrame = tableView.convert(tableView.cellForRow(at: indexPath)!.frame, to: tableView.superview)

        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        if let image = UIImage(named: photos[indexPath.row]) {
            detailVC.image = image
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}

extension HomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == UINavigationControllerOperation.push {
            transition.operation = UINavigationControllerOperation.push
            transition.duration = 1
            transition.selectedFrame = self.selectedCellFrame
            return transition
        }
        
        if operation == UINavigationControllerOperation.pop {
            transition.operation = UINavigationControllerOperation.pop
            transition.duration = 1
            
            return transition
        }
        
        return nil
    }
}
