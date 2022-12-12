//
//  ShouyeSelectMenuCell.swift
//  First1
//
//  Created by New on 2022/12/8.
//

import Foundation

class ShouyeSelectMenuCell:UITableViewCell {
    
    var selectMenuView:SelectMenuView?
    
    var model:ShouyeSelectMenuCellModel = ShouyeSelectMenuCellModel()
    
    var callBack: (_ model:SelectMenuCellModel) ->() = {model in }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addSubView1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
    
        //cell
        selectionStyle = .none
        
        //selectMenuView
        selectMenuView = SelectMenuView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: model.subModel.height))
        selectMenuView?.delegate = self
        selectMenuView?.addSubviewWithModel(model1: model.subModel)
        
    }
    
    func addSubView1() {
        
        contentView.addSubview(selectMenuView ?? SelectMenuView())
    }
}

extension ShouyeSelectMenuCell:SelectMenuViewDelegate {
    
    func didSelectIndex(Index: Int) {
        
        let subModel:SelectMenuCellModel = model.subModel.btnModelArray[Index] as! SelectMenuCellModel
        
        callBack(subModel)
    }
}

class ShouyeSelectMenuCellModel:BaseModel {
    
    var subModel:SelectMenuModel {
        
        get {
            
            let jsonString = JsonUtil.getJSONStringFromArray(array:array)

            let modelarray = JsonUtil.jsonArrayToModel(jsonString, SelectMenuCellModel.self)
            let subM:SelectMenuModel = SelectMenuModel()
            subM.btnHeight = 50
            subM.top = 15
            subM.btnMargin = 15
            subM.pageConut = 10
            subM.column = 5
            subM.btnModelArray = modelarray
            subM.pointWidth = 7
            subM.pointMargin = 4
            subM.pointHeight = 7
            if subM.pageNum > 1 {
                subM.bottomHeight = 5
            }else {
                subM.bottomHeight = 0
            }
            
            return subM
        }
    }
    
    var array = [["icon":"store","title":"维修1"],["icon":"store","title":"维修2"],["icon":"store","title":"维修3"],["icon":"store","title":"维修4"],["icon":"store","title":"维修5"],["icon":"store","title":"维修6"],["icon":"store","title":"维修7"],["icon":"store","title":"维修8"],["icon":"store","title":"维修9"],["icon":"store","title":"维修10"],["icon":"store","title":"维修11"],["icon":"store","title":"维修12"],["icon":"store","title":"维修13"],["icon":"store","title":"维修14"],["icon":"store","title":"维修15"],["icon":"store","title":"维修16"],["icon":"store","title":"维修17"],["icon":"store","title":"维修18"],["icon":"store","title":"维修19"],["icon":"store","title":"维修20"],["icon":"store","title":"维修21"]]
}
