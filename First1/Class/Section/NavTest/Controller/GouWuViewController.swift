//
//  GouWuViewController.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation
import SDWebImage

private let GouWuCellID = "GouWuCell"

class GouWuViewController:BaseCollectionViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
    override func getDate() {
        
//        let jArray2:[Any] = [["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-2.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-2.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-13.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-13.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-2.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-2.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-13.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/jianjie.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/slider-bg-13.jpg"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"http://www.djy-es.com/statics/images/zhunzhe.jpg"]]
        
//        model.jsonZhuanModelWithTypel(GouWuCellModel.self, jsonArray1: jArray2) {
//
//            HUDManager.shard.show()
//
//            for sModel2 in model.subModelArray {
//
//                let VM:GouWuCellViewModel = GouWuCellViewModel.init()
//                VM.cellTyle = .TwoLie
//                VM.delegate = self
//                VM.model = sModel2 as? GouWuCellModel
//                model.subModelArray2.add(VM)
//            }
//
//        }
        
    }
    
    override func setupUI() {
        
        let layout:UICollectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let  margin: CGFloat = 5
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        collectionView.register(GouWuCell.self, forCellWithReuseIdentifier: GouWuCellID)
        collectionView.showsVerticalScrollIndicator = false
        
        model.statusBarStyle = .default
        
        let sMode:NavTitleModel = titleView.model ?? NavTitleModel()
        sMode.title = "购物"
        sMode.titleColor = "#000000"
        sMode.backColor = "#f8f8f8"
        sMode.vcCount = navigationController?.children.count ?? 1

        titleView.model = sMode
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let VM:GouWuCellViewModel = model.vModelArray[indexPath.row] as! GouWuCellViewModel
        
        return VM.contentSize
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.vModelArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let VM:GouWuCellViewModel = model.vModelArray[indexPath.row] as! GouWuCellViewModel
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: GouWuCellID, for: indexPath) as! GouWuCell
        
        cell1.vModel = VM
        
        return cell1
        
    }
    
    override func waterFlowLayout(_ waterFlowLayout: WaterFallFlowLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        
        let VM:GouWuCellViewModel = model.vModelArray[indexPath.row] as? GouWuCellViewModel ?? GouWuCellViewModel()
        
        var height:CGFloat = 60
        
        
        if(VM.contentSize.height <= 0) {
            
            height = 60
        }else {
            
            height = VM.contentSize.height
        }
        
        return height
    }
    
    override func waterFlowLayoutSection() -> Int {
        
        return 2
        
    }
    
    deinit {
        
        SDImageCache.shared.clearMemory()
    }
    
}

extension GouWuViewController:GouWuCellViewModelDelegate {
    
    func comGetHeight() {
        
        if(model.arrayCout == model.jsonArray.count) {
            
            collectionView.reloadData()
            HUDManager.shard.dismiss()
        }else {
            
            model.arrayCout = model.arrayCout + 1
        }
        
    }
    
}

