//
//  userProfileViewController.swift
//  weWrk_1
//
//  Created by Pan Guan on 3/25/17.
//  Copyright © 2017 luis castill0. All rights reserved.
//

import UIKit
import Firebase


class userProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var containverView: UIView!
    
    var profileViewController: UIViewController?
    var viewPlaceViewController: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeViewController = profileViewController

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeButtonPress(_ sender: Any) {
        print("To Places View")
        activeViewController = viewPlaceViewController
        self.performSegue(withIdentifier: "toPlaceView", sender: nil)

    }
    
    @IBAction func profileButtonPress(_ sender: UIButton) {
        print("To profile View")
        activeViewController = profileViewController
    }
    
    private var activeViewController: UIViewController? {
        didSet {
        removeInactiveViewController(inactiveViewController: oldValue)
        updateActiveViewController()
    
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMove(toParentViewController: nil)
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = containverView.bounds
            containverView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMove(toParentViewController: self)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
