//
//  LunboqiView.swift
//  First1
//
//  Created by New on 2022/12/6.
//

import Foundation

private let LunboqiCellID = "LunboqiCell"

@objc protocol LunboqiViewDelegate : NSObjectProtocol {
    
    @objc optional func didSelectIndexCollectionViewCell(index: Int)->Void
}

class LunboqiView:UIView {
    
    weak var delegate : (LunboqiViewDelegate)?
    var collectionView: UICollectionView?
    lazy var model = LunboqiViewModel()
    lazy var pageControl = UIPageControl()
    lazy var flowlayout = UICollectionViewFlowLayout()
    var timer:Timer?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        flowlayout.itemSize = CGSizeMake(frame.size.width, frame.size.height)
        flowlayout.minimumInteritemSpacing = model.margin
        flowlayout.minimumLineSpacing = model.margin
        flowlayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        collectionView = UICollectionView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), collectionViewLayout: flowlayout)
        collectionView?.backgroundColor = UIColor.lightGray
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource  = self
        collectionView?.delegate = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.register(LunboqiCell.self, forCellWithReuseIdentifier: LunboqiCellID)
        addSubview(collectionView!)
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.height - 25, width: frame.size.width, height: 22))
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.contentHorizontalAlignment = .center
        pageControl.numberOfPages = model.cellModelArray.count

        addSubview(pageControl)
        reloadData()
    }
    
}

//扩展方法

extension LunboqiView {
    
    //定时器初始化
    func addTimer(){
        
        removeTimer()
        
        let timer1 = Timer.init(timeInterval: TimeInterval(model.duration), target: self, selector: #selector(nextPageView), userInfo: nil, repeats: true)
        RunLoop.current.add(timer1, forMode: RunLoop.Mode.common)
        timer = timer1
    }
    
    //定时器销毁
    func removeTimer(){
        
        timer?.invalidate()
        timer = nil
    }
    
    //下一个视图
    @objc func nextPageView(){

        if model.cellModelArray.count > 1 {
            
            var pageNum = 0
            
            if model.scrollModel == .horizontal {
                
                pageNum = lroundf(Float((collectionView?.contentOffset.x ?? 1)/self.frame.size.width))
            }else {
                
                pageNum = lroundf(Float((collectionView?.contentOffset.y ?? 1)/self.frame.size.height))
            }
            
            scrollTo(pageNum: pageNum + 1, animated: true)
        }
    }
    
    func scrollTo(pageNum: Int, animated: Bool) {
        
        if model.scrollModel == .horizontal {
            
            collectionView?.setContentOffset(CGPoint.init(x: self.frame.size.width * CGFloat(pageNum), y: 0), animated: animated)
        }else {
            
            collectionView?.setContentOffset(CGPoint.init(x: 0, y: self.frame.size.height * CGFloat(pageNum)), animated: animated)
        }
        
    }
    
    func reloadData() {
        
        if model.cellModelArray.count > 1 {
         
            scrollTo(pageNum: 1, animated: false)
            addTimer()
        }
        
        if model.scrollModel == .horizontal {
            
            if model.cellModelArray.count > 1 {
                
                pageControl.isHidden = false
                
            }else {
                
                pageControl.isHidden = true
            }
            
            flowlayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        }else {
        
            flowlayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            pageControl.isHidden = true
        }
        
        collectionView?.reloadData()
    }
    

}

extension LunboqiView:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return model.section
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if model.cellModelArray.count > 1{
            
            return model.cellModelArray.count + 2
        }else {
            
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LunboqiCellID, for: indexPath) as! LunboqiCell
        
        if indexPath.row == 0 {

            cell.model = model.cellModelArray.last as? LunboqiCellModel

        }else if indexPath.row == model.cellModelArray.count + 1{

            cell.model = model.cellModelArray.first as? LunboqiCellModel

        }else{
            
            let sModel = model.cellModelArray[indexPath.row - 1]
            
            cell.model = sModel as? LunboqiCellModel
        }
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if model.cellModelArray.count == 1 {
            
            delegate?.didSelectIndexCollectionViewCell?(index: 0)
        }else {
            
            var index = indexPath.row
            
            if index == 0 {
                
                index = model.cellModelArray.count - 1
            }else if index == model.cellModelArray.count + 1 {
                
                index = 0
            }else {
                
                index = index - 1
            }
            
            delegate?.didSelectIndexCollectionViewCell?(index: index)
        }
        
        
    }
    
    //滚动中
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var offset = CGFloat(0)
        
        var x :CGFloat = 0
        
        if model.scrollModel == .horizontal {
            
            offset = scrollView.contentOffset.x
            x = self.frame.size.width
        }else {
            
            offset = scrollView.contentOffset.y
            x = self.frame.size.height
        }
        
        if offset <= 0 {
            scrollTo(pageNum: model.cellModelArray.count, animated: false)
            self.pageControl.currentPage = model.cellModelArray.count - 1
        } else if offset >= CGFloat(model.cellModelArray.count + 1) * x {
            scrollTo(pageNum: 1, animated: false)
            self.pageControl.currentPage = 0
        } else {
           self.pageControl.currentPage = lroundf(Float(offset/self.frame.size.width)) - 1
        }
        
    }
    
    //重新添加定时器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        self.addTimer()
    }
    
    //手动滑动的时候销毁定时器
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        self.removeTimer()
    }
    
}

class LunboqiViewModel:BaseModel {

    enum ScrollMode: Int {
        
        case horizontal = 0
        case vertical = 1
    }

    var margin:CGFloat = 0
    var scrollModel:ScrollMode = .horizontal
    var section:Int = 1
    var duration:Int = 5
    lazy var cellModelArray = {

        let array = [["imageUrl":"http://www.djy-es.com/statics/lunbo/1.jpg","content":"1"],["imageUrl":"http://www.djy-es.com/statics/lunbo/2.jpg","content":"2"],["imageUrl":"http://www.djy-es.com/statics/lunbo/3.jpg","content":"3"],["imageUrl":"http://www.djy-es.com/statics/lunbo/4.jpg","content":"4"],["imageUrl":"http://www.djy-es.com/statics/lunbo/5.jpg","content":"5"]]
        
        let jsonString = JsonUtil.getJSONStringFromArray(array:array)

        let modelarray = JsonUtil.jsonArrayToModel(jsonString, LunboqiCellModel.self)
        
        return modelarray

    }()
}
