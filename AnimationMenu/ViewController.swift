//
//  ViewController.swift
//  AnimationMenu
//
//  Created by X901 on 3/31/17.
//  Copyright © 2017 Basil Baragabah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var closeButtonCenter : CGPoint!
    var menuButtonCenter : CGPoint!

    @IBOutlet weak var MenuButtonTop: NSLayoutConstraint!
    
    @IBOutlet weak var menu: UIButton!
    
    @IBOutlet weak var Close: UIButton!
    
    @IBOutlet weak var backgroundMenuView: UIView!
    
    @IBOutlet weak var darkFillView: RoundButton!
    
    @IBOutlet weak var menuButtons: UIStackView!
    
    @IBOutlet weak var topConatraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButtonCenter = menu.center
        closeButtonCenter = Close.center
        
        Close.center = menu.center
        
        
        darkFillView.alpha = 0
        
      topConatraint.constant = -67
        
        MenuButtonTop.constant = 230
        
        menuButtons.alpha = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    @IBAction func menuClicked(_ sender: UIButton) {
        
        self.topConatraint.constant = 0

        MenuButtonTop.constant = 114

self.menu.isHidden = true
        if darkFillView.transform == CGAffineTransform.identity{

        
        UIView.animate(withDuration: 0.3, animations: {

self.view.layoutIfNeeded()
            self.darkFillView.alpha = 1

            self.darkFillView.transform = CGAffineTransform(scaleX: 30, y: 30)
            
            self.menuButtons.alpha = 1
            
            

        })
            
        }
        
        
       UIView.animate(withDuration: 0.5) {

        self.Close.alpha = 1
self.menu.alpha = 0
    self.Close.center = self.closeButtonCenter
    

        }
    }
    
    
    @IBAction func closeClicked(_ sender: Any) {
        
        topConatraint.constant = -67

self.menu.isHidden = false
        
        self.menu.center = self.Close.center

        UIView.animate(withDuration: 0.5) {
            self.Close.alpha = 0
            self.menu.alpha = 1
            self.menuButtons.alpha = 0

            self.MenuButtonTop.constant = 230

            self.view.layoutIfNeeded()

            
            
           self.Close.center = self.menuButtonCenter
            
         self.menu.center = self.menuButtonCenter

            self.Close.isHidden = false


        }
        
        UIView.animate(withDuration: 0.5 , animations: {
            
            self.darkFillView.alpha = 0

            self.darkFillView.transform = .identity

        })
        
    }


}

