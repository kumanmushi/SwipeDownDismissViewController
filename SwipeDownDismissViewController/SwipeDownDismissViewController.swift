//
//  SwipeDownDismissViewController.swift
//  SwipeDownDismissViewController
//
//  Created by 村田真矢 on 2019/06/22.
//  Copyright © 2019 村田真矢. All rights reserved.
//

import UIKit

open class SwipeDownDismissViewController: UIViewController {

    public var startDismissPositionRate: CGFloat = 0.3
    
    public private(set) var isScrolling: Bool = false
    public private(set) var isDismissing: Bool = false
    
    private var initialTouchPoint = CGPoint.zero
    
    public func dismiss(completion: (() -> Void)?) {
        self.isDismissing = true
        self.dismiss(animated: true) {
            completion?()
        }
    }
    
    public func swipeDownDismiss(_ sender: UIPanGestureRecognizer, dismissal: (() -> Void)?) {
        self.handle(sender: sender) {
            self.dismiss(completion: {
                dismissal?()
            })
        }
    }
    
    public func swipeDown(_ sender: UIPanGestureRecognizer, dismissAction: (() -> Void)?) {
        self.handle(sender: sender) {
            dismissAction?()
        }
    }
    
    private func handle(sender: UIPanGestureRecognizer, dismissAction: (() -> Void)? = nil) {
        let touchPoint = sender.location(in: self.view?.window)
        
        switch sender.state {
        case .began:
            self.initialTouchPoint = touchPoint
            self.isScrolling = true
        case .changed:
            if touchPoint.y > self.initialTouchPoint.y {
                self.view.frame.origin.y = touchPoint.y - self.initialTouchPoint.y
                if let navigationBar: UINavigationBar = self.navigationController?.navigationBar {
                    navigationBar.frame.origin.y = touchPoint.y - self.initialTouchPoint.y + UIApplication.shared.statusBarFrame.height
                }
            }
        case .ended, .cancelled:
            if touchPoint.y - self.initialTouchPoint.y > self.view.frame.height * self.startDismissPositionRate {
                self.isDismissing = true
                dismissAction?()
            } else {
                let size: CGSize = self.view.frame.size
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                    if let navigationBar: UINavigationBar = self.navigationController?.navigationBar {
                        navigationBar.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: size.width, height: size.height)
                    }
                })
            }
            self.isScrolling = false
        case .failed, .possible:
            self.isScrolling = false
        @unknown default:
            fatalError()
        }
    }
}
