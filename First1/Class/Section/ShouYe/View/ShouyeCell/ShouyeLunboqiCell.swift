//
//  ShouyeLunboqiCell.swift
//  First1
//
//  Created by New on 2022/12/7.
//

import Foundation

class ShouyeLunboqiCell:UITableViewCell {
    
    var lunboqiView:LunboqiView = LunboqiView.init(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenW / 1.7))
    var model:ShouyeLunboqiModel = ShouyeLunboqiModel()
    var callBack: (_ model:LunboqiCellModel) ->() = {model in }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addSubview1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        lunboqiView.delegate = self
        lunboqiView.model.scrollModel = .horizontal
        lunboqiView.model.cellModelArray = model.cellModelArray
        
        lunboqiView.reloadData()
        
    }
    
    func addSubview1() {
        
        contentView.addSubview(lunboqiView)
    }
    
    func addTimer() {
        
        lunboqiView.addTimer()
    }
    
    func removeTimer() {
        
        lunboqiView.removeTimer()
    }
    
}

extension ShouyeLunboqiCell:LunboqiViewDelegate {
    
    func didSelectIndexCollectionViewCell(index: Int) {
        
        let cellModel:LunboqiCellModel = model.cellModelArray[index] as! LunboqiCellModel
        
        callBack(cellModel)
    }
}

class ShouyeLunboqiModel:BaseModel {
    
    lazy var cellModelArray = {

        let array = [["imageUrl":"http://www.djy-es.com/statics/lunbo/5.jpg","content":"5"],["imageUrl":"http://www.djy-es.com/statics/lunbo/4.jpg","content":"4"],["imageUrl":"http://www.djy-es.com/statics/lunbo/3.jpg","content":"3"],["imageUrl":"http://www.djy-es.com/statics/lunbo/2.jpg","content":"2"],["imageUrl":"http://www.djy-es.com/statics/lunbo/1.jpg","content":"1"]]
        
        let jsonString = JsonUtil.getJSONStringFromArray(array:array)
        
        let modelarray = JsonUtil.jsonArrayToModel(jsonString, LunboqiCellModel.self)
        
        return modelarray

    }()
    
    
    func getLunboqiModel(result1:@escaping (_ array1:[Any])->Void) {
        
        
    }
}
