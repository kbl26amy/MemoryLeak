//
//  mydelegate.swift
//  MemoryLeak
//
//  Created by 楊雅涵 on 2019/8/21.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import Foundation
import UIKit

protocol MyDelegate: class  {
    func someDelegateFunction()
}

class CustomView: UIView {
    weak var delegate: MyDelegate?
    
    deinit {
        // 為了可以清楚有被釋放，所以在釋放時印出字串
        print("deinit")
    }
}
