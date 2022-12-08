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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addSubView1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
    
        selectionStyle = .none
        
        
        selectMenuView = SelectMenuView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: model.subModel.height))
        
        selectMenuView?.model = model.subModel
        
        selectMenuView?.addSubview1()
    }
    
    func addSubView1() {
        
        contentView.addSubview(selectMenuView ?? SelectMenuView())
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
            if subM.pageNum > 1 {
                subM.bottomHeight = 20
            }else {
                subM.bottomHeight = 0
            }
            
            return subM
        }
    }
    
    var array = [["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"],["icon":"tijiaoyanzhi","title":"维修"]]
    
}
