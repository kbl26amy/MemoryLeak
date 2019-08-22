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
## Closure
# 留意使用unowned 、 weak 的差異

*為了驗證我們創造了一個 Class 的 Object 設計 Closure 內容*



* 使用weak時self需加上問號， unowned 則擔保了不為 nil

>unowned 

     lazy var capture: ()->() = { [unowned self] in
        print(self.text)
        self.myMethod()
    }


----
## Tips
* weak 或 unowned 的設定要找到最後一條retain cycle
                  
* 可以使用 CFGetRetainCount 去看 Object 的 RetainCount
(也可以使用 navigationController?.viewControllers.count 去看 ＶＣ 數量

*  使用 weak 或 unwoned 就是告訴電腦不要增加 RetainCount

*  Func 裡的生成的 Object 在方法執行完畢後會斷開 retain

* 在第一個 VC 裡 addSubView 的話， 必須去removeFromSuperview() 再讓它 = nil ， 順序非常重要，且必須明白 navigationController?.viewControllers 的陣列存在

* 可以點擊xcode裡面的 Debug Memory Graph 查看當前所產生的 Leak 與圖形

* Closure 的程式碼片段本身也是一個 Object 會佔據一“塊”記憶體， 當使用 Closure 變數時，這個變數也會再佔據一”個“記憶體位置，存取 Closure的記憶體區塊第一個位置。

* Struct 雖然是value type，但是在沒有修改前，為了避免佔據太多記憶體，有 copy on write的特性 
