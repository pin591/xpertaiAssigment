//
//  PopUpWiewController.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import UIKit

class PopUpWiewController: UIViewController {

    private let popUpHistoryView = PopUpView()

    init(title: String, text: String, buttontext: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        
        popUpHistoryView.popupTitle.text = title
        popUpHistoryView.popupText.text = text
        popUpHistoryView.popupButton.setTitle(buttontext, for: .normal)
        popUpHistoryView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view = popUpHistoryView
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dismissView() {
           self.dismiss(animated: true, completion: nil)
       }
}
