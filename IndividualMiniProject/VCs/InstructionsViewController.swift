//
//  Employee.swift
//  IndividualMiniProject
//
//  Created by Saleh Bin Essa on 03/03/2024.
//

import UIKit
import SnapKit

class InstructionsViewController: UIViewController {
    
    
    let textLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAutoLayout()
        title = "Instructions"
    }
    
    func setupUI() {
        view.backgroundColor = .lightGray
        
        textLabel.text = """
        Instructions...
        """
        textLabel.numberOfLines = 0
        textLabel.font = .systemFont(ofSize: 15, weight: .bold)
        textLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setupAutoLayout() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    
}
