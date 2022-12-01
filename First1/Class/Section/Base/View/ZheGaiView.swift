//
//  ZheGaiView.swift
//  First1
//
//  Created by New on 2022/12/1.
//

import Foundation

class ZheGaiView:UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //        if #available(iOS 13, *) {
    //            window = UIApplication.shared.connectedScenes
    //                .compactMap { $0 as? UIWindowScene }
    //                .flatMap { $0.windows }
    //                .first(where: { $0.isKeyWindow })
    //        } else {
    //            window = UIApplication.shared.keyWindow
    //        }
    
    func setupUI() {
        
        if #available(iOS 13, *) {
            
            isUserInteractionEnabled = false
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .lightGray
            layer.compositingFilter = "saturationBlendMode"
        }else {
            
            isHidden = true
        }
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        return nil
    }
}
