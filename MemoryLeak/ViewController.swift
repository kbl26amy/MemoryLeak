//
//  ViewController.swift
//  MemoryLeak
//
//  Created by 楊雅涵 on 2019/8/21.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyDelegate  {

//    實現closure的deinit
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var myObject: MYObject? = MYObject()
        myObject?.capture()
        myObject = nil
        
    }
//     
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        newView = CustomView(frame: CGRect(x: 60, y: 120, width: 300, height: 300))
//        newView?.delegate = self
//        newView?.backgroundColor = .black
//        self.view.addSubview(newView!)
//        someDelegateFunction()
//
//        print(navigationController?.viewControllers.first)
//        print(self)
//    }
    
    var newView : CustomView?
    
    func someDelegateFunction() {
        print("Do stuff")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        newView?.removeFromSuperview()
        newView = nil
        
        print("view disappear")
    }

}

