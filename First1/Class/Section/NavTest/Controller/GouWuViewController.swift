//
//  GouWuViewController.swift
//  First1
//
//  Created by New on 2022/11/12.
//

import Foundation

private let GouWuCellID = "GouWuCell"

class GouWuViewController:BaseCollectionViewController {
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
    }
    
    override func getDate() {
    
//        let jArray1:[Any] = [["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"]]
        
        let jArray2:[Any] = [["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage3"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage3"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage3"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage3"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"],["title":"棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉","image":"titleimage2"]]
        
        model.jsonZhuanModelWithTypel(GouWuCellModel.self, jsonArray1: jArray2) {
            
            for sModel2 in model.subModelArray {

                let VM:GouWuCellViewModel = GouWuCellViewModel.init()
                VM.cellTyle = .TwoLie
                VM.model = sModel2 as? GouWuCellModel
                model.subModelArray2.add(VM)
            }
            
            let firstM:GouWuCellModel = GouWuCellModel()
            let firstVM:GouWuCellViewModel = GouWuCellViewModel.init()
            firstVM.cellTyle = .TwoLie
            firstM.title = "棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉"
            firstM.image = "titleimage3"
            firstVM.model = firstM
            
            let secodM:GouWuCellModel = GouWuCellModel()
            let secodVM:GouWuCellViewModel = GouWuCellViewModel.init()
            secodVM.cellTyle = .TwoLie
            secodM.title = "棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉,棉花川贝制作，新疆长绒棉"
            secodM.image = "titleimage3"
            secodVM.model = secodM
            
//            model.subModelArray2.add(firstvM)
            
            model.subModelArray2.insert(firstVM, at: 0)
            
            
            collectionView.reloadData()
            
        }
        
    }
    
    override func setupUI() {
        
        collectionView.register(GouWuCell.self, forCellWithReuseIdentifier: GouWuCellID)
        collectionView.showsVerticalScrollIndicator = false
        
        let layout:UICollectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let  margin: CGFloat = 8
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        
        
        model.statusBarStyle = .default
        
        let sMode:NavTitleModel = titleView.model ?? NavTitleModel()
        sMode.title = "购物"
        sMode.titleColor = "#000000"
        sMode.backColor = "#f8f8f8"
        sMode.vcCount = navigationController?.children.count ?? 1

        titleView.model = sMode
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.subModelArray2.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let VM:GouWuCellViewModel = model.subModelArray2[indexPath.row] as! GouWuCellViewModel
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: GouWuCellID, for: indexPath) as! GouWuCell
        
        cell1.vModel = VM
        
        return cell1
        
    }
    
    override func waterFlowLayout(_ waterFlowLayout: WaterFallFlowLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        
        let VM:GouWuCellViewModel = model.subModelArray2[indexPath.row] as! GouWuCellViewModel
        
        return VM.contentHeight
    }
    
    override func waterFlowLayoutSection() -> Int {
        
        return 2
        
    }
    
}

