//
//  SelectMenuView.swift
//  First1
//
//  Created by New on 2022/12/7.
//

import Foundation

@objc protocol SelectMenuViewDelegate : NSObjectProtocol {
    
    @objc optional func didSelectIndex(Index: Int)->Void
}

class SelectMenuView:UIView {
    
    weak var delegate : (SelectMenuViewDelegate)?
    let scrollView:UIScrollView = UIScrollView()
    var pageControl:PageControl?
    var model:SelectMenuModel = SelectMenuModel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        scrollView.isPagingEnabled = true
        scrollView.frame = self.bounds
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        addSubview(scrollView)
    }
    
    func addSubviewWithModel(model1:SelectMenuModel) {

        model = model1
        
        scrollView.contentSize = CGSize(width: self.bounds.width * CGFloat(model.pageNum), height: self.bounds.height)
        
        if model.btnArray.count != 0 {
            
            for i in 0..<model.btnArray.count {
                
                let btn:UIButton = model.btnArray[i]
                
                btn.removeFromSuperview()
            }
            
            model.btnArray = []
            pageControl?.removeFromSuperview()
        }
        
        for i in 0..<(model.btnModelArray.count ) {
            
            let sModel:SelectMenuCellModel = model.btnModelArray[i] as! SelectMenuCellModel
            
            //列
            let column = (i % model.pageConut) % model.column
            // 行
            let row = (i % model.pageConut) / model.column
            //页数
            let page = i / model.pageConut
            
            let x:CGFloat = self.bounds.width * CGFloat(page) + model.btnMargin + CGFloat(column) * (model.btnWidth + model.btnMargin)
            
            let y:CGFloat = model.top + CGFloat(row) * (model.btnHeight + model.btnMargin)
            
            let btn = UIButton(frame: CGRect(x:x, y: y, width: model.btnWidth, height: model.btnHeight))
            
            btn.setTitleColor(.black, for: UIControl.State.normal)
            btn.setImage(UIImage.svgWithName(name: sModel.icon, size: CGSize(width: model.btnImageWH, height: model.btnImageWH)), for: UIControl.State.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.backgroundColor = UIColor.coloWithHex(hexStr: "#808080", alpha: 0.3)
            btn.setTitle(sModel.title, for: UIControl.State.normal)
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            btn.changBtnWithStytl(btnStyle: .imageTop, margin: 2)
            scrollView.addSubview(btn)
            
            model.btnArray.append(btn)
        }
        
        //pageControl
        
        let pageModel:PageControlModel = PageControlModel()
        pageModel.margin = model.pointMargin
        pageModel.pointHeight = model.pointHeight
        pageModel.pointWidth = model.pointWidth
        pageModel.pageNum = model.pageNum
        pageControl = PageControl.init(frame: CGRect(x: (self.bounds.width - pageModel.allWitdth) / 2, y: model.height - model.bottomHeight, width: pageModel.allWitdth, height: model.bottomHeight))
        pageControl?.setupUIWithModel(model1: pageModel)
        addSubview(pageControl ?? PageControl())
    }
    
    @objc func btnClick(btn:UIButton) {
        
        let string:String = btn.titleLabel?.text ?? ""
        
        for i in 0..<model.btnModelArray.count {
                
            let btnModel:SelectMenuCellModel = model.btnModelArray[i] as! SelectMenuCellModel
            
            if string == btnModel.title {
                
                delegate?.didSelectIndex?(Index: i)
            }
        }
    }
    
}

extension SelectMenuView:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let Index:Int = Int(scrollView.contentOffset.x / ScreenW)
        
        pageControl?.changColorWithIndex(Index: Index,isAnimation: true)
    }
}

class SelectMenuModel:BaseModel {
    
    //高度
    var height:CGFloat {
        
        get {
            
            return top * CGFloat(currentRow + 1) + btnHeight * CGFloat(currentRow) + bottomHeight
        }
    }
    
    //按钮数组
    lazy var btnArray:[UIButton] = []
    //模型数组
    lazy var btnModelArray:[Any] = []
    //页数
    var pageNum:Int {
        
        get {
            
            return Int(ceil(CGFloat(btnModelArray.count) / CGFloat(pageConut)))
        }
    }
    //列数
    lazy var column:Int = 5
    
    //行数
    var currentRow:Int {
        
        get {
            
            var row = 0
            
            if btnModelArray.count >= pageConut {
                
                row = Int(ceil(CGFloat(pageConut) / CGFloat(column)))
            }else {
                
                row = Int(ceil(CGFloat(btnModelArray.count % pageConut) / CGFloat(column)))
            }
            
            return row
        }
    }
    //指示器高度
    var bottomHeight:CGFloat = 0
    //一页最大个数
    lazy var pageConut:Int = 10
    //按钮横向间距
    lazy var btnMargin:CGFloat = 15
    //按钮纵向间距
    lazy var top:CGFloat = 15
    //按钮图片大小
    var btnImageWH:CGFloat {
        
        get {
            
            return btnHeight * 0.7
        }
    }
    //按钮高度
    lazy var btnHeight:CGFloat = 10
    //按钮高度
    var btnWidth:CGFloat {
        
        get {
            
            
            return (ScreenW - btnMargin * CGFloat(column + 1)) / CGFloat(column)
        }
    }
    
    var pointHeight:CGFloat = 5
    var pointWidth:CGFloat = 5
    var pointMargin:CGFloat = 3
    
}

class SelectMenuCellModel:BaseModel {
    
    var icon:String = ""
    var title:String = ""
    var subVC:String = ""
}
