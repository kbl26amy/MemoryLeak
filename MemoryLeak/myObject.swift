//
//  myObject.swift
//  MemoryLeak
//
//  Created by 楊雅涵 on 2019/8/21.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import Foundation

class MYObject {
    
    var text = "my text"
    
    deinit {
//      在釋放時印出字串
        debugPrint("deinit")
    }
    
    func myMethod() {
        debugPrint("myMethod")
    }
    
//     主角的 closure ，為了可以存取到 self ，所以加上 lazy 這個前綴
//    lazy var capture: ()->() = {
//        print(self.text)
//        self.myMethod()
//    }

//     使用 unowned 這樣 self 就不是 optional，若用 weak 會需要加上問號
    lazy var capture: ()->() = { [unowned self] in
        print(self.text)
        self.myMethod()
    }
}

