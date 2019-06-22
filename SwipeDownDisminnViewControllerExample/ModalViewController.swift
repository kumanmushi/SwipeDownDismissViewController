//
//  ModalViewController.swift
//  SwipeDownDisminnViewControllerExample
//
//  Created by 村田真矢 on 2019/06/22.
//  Copyright © 2019 村田真矢. All rights reserved.
//

import UIKit
import SwipeDownDismissViewController

class ModalViewController: SwipeDownDismissViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func panGestureAction(_ sender: UIPanGestureRecognizer) {
        self.scrollDownDismiss(sender, dismissal: nil)
    }
    
    @IBAction func dismissButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
