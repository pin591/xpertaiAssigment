//
//  PopUpHistoryView.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import UIKit
import SnapKit

class PopUpHistoryViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Elements selected"
        label.numberOfLines = 0
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "description"
        label.numberOfLines = 0
        return label
    }()
    
//    let container: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 24
//        return view
//    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    override func viewDidLoad() {
//        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
//        self.view.frame = UIScreen.main.bounds
//        self.view.addSubview(container)
//
//        container.snp.makeConstraints() {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.width.equalToSuperview().multipliedBy(0.7)
//            $0.height.equalToSuperview().multipliedBy(0.45)
//        }
        
//        container.addSubview(stack)
        self.view(stack)
//        stack.snp.makeConstraints() {
//            $0.leading.equalTo(container.snp.leading)
//            $0.trailing.equalTo(container.snp.trailing)
//            $0.centerY.equalTo(container.snp.centerY)
//            $0.height.equalTo(container.snp.height).multipliedBy(0.5)
//
//        }
    }
}
