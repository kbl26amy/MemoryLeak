# ARC與Memory Leak

----
## 練習 Memory Management

> 
分別透過 Delegate 跟 Closure 產生 Memory Leak，並提出 Leak 的證據

----
## 使用觀念

1. ARC
2. Retain Cycle
3. Memory Leak
4. Weak and Unowned
----
## markdown quick reference
# headers

*e使用unowned 、 weak 的差異*



* 使用weak時self需加上問號

>unowned 

     lazy var capture: ()->() = { [unowned self] in
        print(self.text)
        self.myMethod()
    }


----
## Tips
* weak 或 unowned 的設定要找到最後一條retain cycle:

                      
* 可以使用 CFGetRetainCount 去看 Object 的 RetainCount
(也可以使用 navigationController?.viewControllers.count 去看 ＶＣ 數量

*  Func 裡的 VC 在方法執行完畢後會斷開 retain

* 在第一個 VC 裡 addSubView 的話， 必須去removeFromSuperview() 再讓它 = nil ， 順序非常重要，且必須明白 navigationController?.viewControllers 的陣列存在

* 可以點擊xcode裡面的 Debug Memory Graph 查看當前所產生的 Leak 與圖形
