//
//  PageControl.swift
//  First1
//
//  Created by New on 2022/12/9.
//

import Foundation

class PageControl:UIView {
    
    var model:PageControlModel = PageControlModel()
    
    var currentPoint:UIView = UIView()
    
    var backPoint:UIView = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = .clear
    }
    
    func setupUIWithModel(model1:PageControlModel) {
        
        model = model1
        
        if model.subViewArray.count > 0 {
            
            for view1 in model.subViewArray {
                
                view1.removeFromSuperview()
            }
        }
        
        let y = (self.bounds.height - model.pointHeight) / 2
        let width = (self.bounds.width - CGFloat(model.pageNum - 1) * model.margin) / CGFloat(model.pageNum)
        
        for i in 0..<model.pageNum {
            
            let x = CGFloat(i) * (width + model.margin)
            let pointView:UIView = UIView(frame: CGRect(x: x, y: y, width: width, height: model.pointHeight))
            pointView.backgroundColor = .gray
            pointView.layer.cornerRadius = model.pointHeight / 2
            pointView.layer.masksToBounds = true
            if i == 0 {
                
                currentPoint.frame = pointView.frame
                currentPoint.layer.cornerRadius = model.pointHeight / 2
                currentPoint.layer.masksToBounds = true
                currentPoint.backgroundColor = model.currentViewColor
                backPoint = pointView
            }
            addSubview(pointView)
            model.subViewArray.append(pointView)
        }
        
        addSubview(currentPoint)
    }
    
    func changColorWithIndex(Index:Int,isAnimation:Bool) {
        
        if Index >= model.subViewArray.count || Index < 0{
            
            return
        }
        
        if Index != model.currentPage {
            
            let subView = model.subViewArray[Index]
            
            let animationFrame = subView.frame
            
            var x = subView.x
            
            if Index > model.currentPage {
                
                x = subView.x - model.margin
            }
            
            let frame = CGRect(x: x, y: subView.y, width: subView.width + model.margin, height: subView.height)
            
            if isAnimation {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.currentPoint.frame = frame
                    self.backPoint.backgroundColor = UIColor.blue
                } completion: {[weak self] Bool in
                    
                    self?.currentPoint.frame = animationFrame
                    self?.backPoint.backgroundColor = .gray
                    self?.backPoint = subView
                }
            }else {
                
                currentPoint.frame = animationFrame
                backPoint = subView
            }
            
            model.currentPage = Index
        }
    }
}

class PageControlModel:BaseModel {
    
    //子视图数组
    var subViewArray:[UIView] = []
    //页数
    var pageNum:Int = 3
    //间距
    var margin:CGFloat = 1
    //当前page
    var currentPage = 0
    //高度
    var pointHeight:CGFloat = 3
    //宽度
    var pointWidth:CGFloat = 3
    //
    var allWitdth:CGFloat {
        
        get {
            
            return (pointWidth + margin) * CGFloat(pageNum) - margin
        }
    }
    
    var currentViewColor:UIColor = mColor
    
}
