//
//  operation.swift
//  First1
//
//  Created by New on 2022/11/16.
//

import Foundation
import UIKit

class operationVC:BaseViewController {
    
    var cancelBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func setupUI() {
        
        model.statusBarStyle = .lightContent
        
        let mode:NavTitleModel = titleView.model ?? NavTitleModel()
        
        mode.title = "operationVC"
        
        titleView.model = mode
        
        cancelBtn.addTarget(self, action:#selector(cancelOperation), for: UIControl.Event.touchUpInside)
        cancelBtn.setTitleColor(.black, for: UIControl.State.normal)
        cancelBtn.setImage(UIImage.svgWithName(name:"zhantu", size: CGSize(width: 40, height: 40)), for: UIControl.State.normal)
        cancelBtn.sizeToFit()
        view.addSubview(cancelBtn)
    }
    
    @objc func cancelOperation() {
        
        yilai()
    }
    
    //依赖
    func yilai() {
        
        let queue = OperationQueue()
                
        let op1 = BlockOperation {
            
            print("任务1---\(Thread.current)")
        }
           
        let op2 = BlockOperation {
            
            Thread.sleep(forTimeInterval: 3)
            print("任务2---\(Thread.current)")
        }
            
        let op3 = BlockOperation {
            
            print("任务3---\(Thread.current)")
        }
        
        let op4 = BlockOperation {
            
            queue.cancelAllOperations()
            print("任务4---\(Thread.current)")
        }
        //op3依赖于op1，则先完成op1，再完成op3
        op3.addDependency(op1)
        //op1依赖于op2，则先完成op2，再完成op1
        op1.addDependency(op2)
        //最终的依赖关系就是，op2->op1->op3
           
        queue.addOperation(op1)
        queue.addOperation(op2)
        queue.addOperation(op3)
        queue.addOperation(op4)
    }
    
    func start() {
        
        let operation = BlockOperation {
                    
            print("任务---\(Thread.current)")
        }
        
        operation.start()
    }
    
    func start2() {
        
        
        let operation = BlockOperation {
                    
            print("任务---\(Thread.current)")
        }

        operation.addExecutionBlock {
            
            print("任务2---\(Thread.current)")
        }
            
        operation.addExecutionBlock {
            
            print("任务3---\(Thread.current)")
        }
        
        operation.start()
    }
    
    //其他队列
    func qitaDuilie() {
        
        let queue = OperationQueue()
        
        let operation1 = BlockOperation {
            
            print("任务1---\(Thread.current)")
        }
           
        let operation2 = BlockOperation {
            
            print("任务2---\(Thread.current)")
        }
            
        //把操作对象添加到队列
        queue.addOperation(operation1)
        queue.addOperation(operation2)
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        cancelBtn.snp.makeConstraints { make in
            
            make.centerY.centerX.equalToSuperview()
            
        }
    }
}
