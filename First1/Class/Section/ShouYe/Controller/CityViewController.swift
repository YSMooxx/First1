//
//  CityViewController.swift
//  First1
//
//  Created by New on 2022/11/24.
//

import Foundation

private let NormalCityCellID = "NormalCityCell"
private let HotCityCellID = "HotCityCell"
private let latelyCityCellID = "latelyCityCell"


class CityViewController:UIViewController {
    
    lazy var titleView:CityTitleView = CityTitleView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: navHeight + 47))
    
    lazy var resultView:searchResultView = searchResultView()
    
    lazy var showTablewView:UITableView = UITableView(frame: view.frame, style: .plain)
    
    lazy var model:CityModel = CityModel()
    
    var callBack: (_ city:String) ->() = {city in }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        showTablewView.delegate = self
        showTablewView.dataSource = self
        showTablewView.register(NormalCityCell.self, forCellReuseIdentifier: NormalCityCellID)
        showTablewView.register(HotCityCell.self, forCellReuseIdentifier: HotCityCellID)
        showTablewView.register(latelyCityCell.self, forCellReuseIdentifier: latelyCityCellID)
        showTablewView.sectionIndexColor = .gray
        if #available(iOS 15.0, *) {
            showTablewView.sectionHeaderTopPadding = 0;
        }
        view.addSubview(showTablewView)
        
        let titleModel = CityTitleModel()
        titleModel.title = "切换城市"
        titleView.model = titleModel
        titleView.delegate = self
        view.addSubview(titleView)
        
        view.addSubview(resultView)
        resultView.isHidden = true
        resultView.zDelegate = self
    }

    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        showTablewView.snp.makeConstraints { make in
            
            make.top.equalTo(navHeight + 46.75)
            make.bottom.left.right.equalToSuperview()
        }
        
        resultView.snp.makeConstraints { make in
            
            make.top.equalTo(titleView.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
}

extension CityViewController {
    
    func writeTolatelyCities(city:String) {
        
        let filePath = NSHomeDirectory().appending("/Documents/latelyCities.plist")
        
        let array:NSMutableArray?
        
        if model.latelyCityArray.count == 0 {
            
            array = NSMutableArray()
            
            array?.add(city)
            
        }else {
            
            for city1 in model.latelyCityArray {
                
                if city1 == city {
                    
                    return
                }
            }
            
            array = NSMutableArray(contentsOfFile: filePath)
            
            array?.add(city)
            
            if array?.count ?? 0 > 5 {
                
                array?.removeObject(at: 0)
            }
        }
        
        array?.write(toFile:filePath ,atomically:true)
        
    }
    
    func dealStringReturnArray(text:String) -> [String]{
        
        var array:[String] = []
        
        if text.isIncludeChineseIn() {
            
            for str in model.allCityArray {
                
                if str.contains(text) {
                    
                    array.append(str)
                }
            }
        
        }else {
            
            let text1 = text.lowercased()
            
            let text2 = text1.removeAllSapce
            
            print(text2)
            
            for (index,str) in model.allCityPYSXArray.enumerated() {
                
                if str.contains(text2) {
                    
                    array.append(model.allCityArray[index])
                }
            }
            
            if array.count == 0 {
                
                for (index,str) in model.allCityPYArray.enumerated() {
                    
                    if str.contains(text2) {
                        
                        array.append(model.allCityArray[index])
                    }
                }
            }
            
        }
        
        return array
    }
}

extension CityViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return model.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        switch section {
            
        case 0 : return 1
        case 1 : return 1
        case 2 : return 1
            
        default:
            let key = model.titleArray[section]
            return model.allCityDic[key]!.count
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = indexPath.section
        
        switch section {
            
        case 0:
            return model.normalCityHeight
        case 1:
            return model.latelyCityHeight
        case 2:
            return model.hotCityHeight
        default:
            return model.normalCityHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0 :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NormalCityCellID, for: indexPath) as! NormalCityCell
            
            cell.content = UserDef.shard.xCity ?? ""
            
            return cell
        case 1 :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: latelyCityCellID, for: indexPath) as! latelyCityCell
            
            cell.callBack = {[weak self] (city) in
                
                self?.callBack(city)
                self?.dismiss(animated: true)
            }
            
            return cell
        case 2 :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: HotCityCellID, for: indexPath) as! HotCityCell
            
            cell.callBack = {[weak self] (city) in
                
                self?.callBack(String(city))
                self?.writeTolatelyCities(city: city)
                self?.dismiss(animated: true)
            }
            
            return cell
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NormalCityCellID, for: indexPath) as! NormalCityCell
            
            let key = model.titleArray[indexPath.section]
            
            cell.content = model.allCityDic[key]![indexPath.row]
            
            return cell
        }
        
    }
    
    //点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section > 2 {
            
            let key = model.titleArray[indexPath.section]
            
            let city = model.allCityDic[key]![indexPath.row]
            
            writeTolatelyCities(city: city)
            
            callBack(String(city))
            
            dismiss(animated: true)
        }
    }
    
    //右边索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return model.titleArray2
    }
    
    // section头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: model.sectionMargin))
        let title = UILabel(frame: CGRect(x: 15, y: 0, width: ScreenW - 15, height: model.sectionMargin))
        title.text = model.titleArray[section]
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(title)
        view.backgroundColor = tColor
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return model.sectionMargin
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        titleView.cancelClick()
    }
    
}

extension CityViewController:CityTitleViewDelegate {
    
    func didBackButton() {
        
        dismiss(animated: true)
    }
    
    func searchViewBeginEdit() {
        
        self.resultView.isHidden = false
    }
    
    func searchViewEndEdit() {
        
        self.resultView.isHidden = true
    }
    
    func searchViewDidChange(text: String) {
        
        resultView.setupWithArray(array: dealStringReturnArray(text: text))
    }

}

extension CityViewController:searchResultViewDelegate {
    
    func didBeginScroll() {
        
        titleView.resign()
    }
    
    func didSelectCity(city: String) {
        
        writeTolatelyCities(city: city)
        
        callBack(String(city))
        
        dismiss(animated: true)
    }
}
