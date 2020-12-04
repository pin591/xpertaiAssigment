//
//  PopUpView.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import UIKit
import SnapKit

class PopUpView: UIView {
    
    let popupView = UIView(frame: CGRect.zero)
    let popupTitle = UILabel(frame: CGRect.zero)
    let popupText = UILabel(frame: CGRect.zero)
    let popupButton = UIButton(frame: CGRect.zero)
    
    let borderWidth: CGFloat = 2.0
    let titleMarginSpace: CGFloat = 2.0
    
    func setView() {
        popupView.backgroundColor = .white
        popupView.layer.borderWidth = borderWidth
        popupView.layer.masksToBounds = true
        popupView.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    func setTitle() {
        popupTitle.textColor = UIColor.white
        popupTitle.backgroundColor = UIColor.lightGray
        popupTitle.layer.masksToBounds = true
        popupTitle.adjustsFontSizeToFitWidth = true
        popupTitle.clipsToBounds = true
        popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupTitle.numberOfLines = 1
        popupTitle.textAlignment = .center
    }
    
    func setText() {
        popupText.textColor = UIColor.black
        popupText.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        popupText.numberOfLines = 0
        popupText.textAlignment = .center
    }
    
    func setButton() {
        popupButton.setTitleColor(UIColor.white, for: .normal)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupButton.backgroundColor = UIColor.lightGray
    }
    
    func setupViewConstains() {
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.snp.makeConstraints() {
            $0.width.equalTo(293)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()

        }
    }
    
    func setupTitleConstrains() {
        popupTitle.translatesAutoresizingMaskIntoConstraints = false
        popupTitle.snp.makeConstraints() {
            $0.leading.equalTo(popupView.snp.leading).inset(titleMarginSpace)
            $0.trailing.equalTo(popupView.snp.trailing).inset(titleMarginSpace)
            $0.top.equalTo(popupView.snp.top).inset(titleMarginSpace)
            $0.height.equalTo(55)
        }
    }
    
    func setupTextConstrains() {
        popupText.translatesAutoresizingMaskIntoConstraints = false
        
        popupText.snp.makeConstraints() {
            $0.height.greaterThanOrEqualTo(67)
            $0.top.equalTo(popupTitle.snp.bottom).inset(-10)
            $0.leading.equalTo(popupView.snp.leading).inset(15)
            $0.trailing.equalTo(popupView.snp.trailing).inset(20)
            $0.bottom.equalTo(popupButton.snp.top).inset(-8)
        }
    }
    func setupButtonConstrains() {
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.snp.makeConstraints() {
            $0.height.equalTo(44)
            $0.leading.equalTo(popupView.snp.leading).inset(2)
            $0.trailing.equalTo(popupView.snp.trailing).inset(-2)
            $0.bottom.equalTo(popupView.snp.bottom).inset(-2)
        }
    }
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setView()
        setTitle()
        setText()
        setButton()
        
        popupView.addSubview(popupTitle)
        popupView.addSubview(popupText)
        popupView.addSubview(popupButton)
        
        addSubview(popupView)
        
        setupViewConstains()
        setupTitleConstrains()
        setupTextConstrains()
        setupButtonConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


