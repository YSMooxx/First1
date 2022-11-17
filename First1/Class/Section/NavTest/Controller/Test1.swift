//
//  Test1.swift
//  SwiftTest
//
//  Created by New on 2022/11/8.
//

import UIKit

class Test1:BaseViewController {
    
    var cancelBtn:UIButton = UIButton()
    
    var iscancel:Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "首页"
        
        titleView.model = mode
        
        cancelBtn.addTarget(self, action:#selector(cancelGCD), for: UIControl.Event.touchUpInside)
        cancelBtn.setTitleColor(.black, for: UIControl.State.normal)
        cancelBtn.setImage(UIImage.svgWithName(name:"zhantu", size: CGSize(width: 40, height: 40)), for: UIControl.State.normal)
        cancelBtn.sizeToFit()
        view.addSubview(cancelBtn)
    }
    
    @objc func cancelGCD() {
        
        iscancel = true

    }
    
    func start() {
        
        self.iscancel = false
        
        let queue = DispatchQueue.global()
        
        let item = DispatchWorkItem {
 
            for i in 0...6 {
                
                Thread.sleep(forTimeInterval: 1)
                
                if (self.iscancel) {
                    
                    print(self.iscancel)
                    print("线程2------\(i)\(Thread.current)")
                    return
                }else {
                    print(self.iscancel)
                    print("线程1------\(i)\(Thread.current)")
                }
                
            }
        
        }
        
        queue.async(execute: item)
        
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        cancelBtn.snp.makeConstraints { make in
            
            make.centerY.centerX.equalToSuperview()
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        asyncContcurrent()
        
        start()
        
//        let vc:operationVC = operationVC()
//
//        vc.hidesBottomBarWhenPushed = true
//
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func syncSerial() {
        
        print("syncSerial\(Thread.current)")
        print("syncSerial-------begin")
        
        let queue = DispatchQueue(label: "label")
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程1------\(i)\(Thread.current)")
            }
        }
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程2------\(i)\(Thread.current)")
            }
        }
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程3------\(i)\(Thread.current)")
            }
        }
        
        print("syncSerial-------end")
    }
    
    func syncContcurrent() {
        
        print("syncContcurrent\(Thread.current)")
        print("syncContcurrent-------begin")
        
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程1------\(i)\(Thread.current)")
            }
        }
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程2------\(i)\(Thread.current)")
            }
        }
        
        queue.sync {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程3------\(i)\(Thread.current)")
            }
        }
        
        print("syncContcurrent-------end")
    }
    
    
    
    func asyncSerial() {
        
        print("asyncSerial\(Thread.current)")
        print("asyncSerial-------begin")
        
        let queue = DispatchQueue(label: "queue")
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程1------\(i)\(Thread.current)")
            }
        }
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程2------\(i)\(Thread.current)")
            }
        }
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程3------\(i)\(Thread.current)")
            }
        }
        
        print("syncSerial-------end")
    }
    
    func asyncContcurrent() {
        
        print("asyncContcurrent\(Thread.current)")
        print("asyncContcurrent-------begin")
        
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程1------\(i)\(Thread.current)")
            }
        }
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程2------\(i)\(Thread.current)")
            }
        }
        
        queue.async {
            
            for i in 0...2 {
                
                Thread.sleep(forTimeInterval: 2)
                print("线程3------\(i)\(Thread.current)")
            }
        }
        
        print("asyncContcurrent-------end")
    }
    
}
