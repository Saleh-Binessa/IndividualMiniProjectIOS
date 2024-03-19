//
//  Employee.swift
//  IndividualMiniProject
//
//  Created by Saleh Bin Essa on 03/03/2024.
//

import UIKit
import SnapKit
class EmployeeViewController: UIViewController {
    var recivedfullName: String?
    var recivedemployeeImage: String?
    var recivedEmployeeSalary: String?
    var recivedEmail:String?
    var recivedPhoneNumber: String?
    
    let generateContainer = UIView()
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let salaryLabel = UILabel()
    let emailLabel = UILabel()
    let employeeUIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let appearance = UINavigationBarAppearance()
       
        title = "User Details page"
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
        setUpUI()
    }
    func setUpUI(){
        view.addSubview(employeeUIImageView)
        view.addSubview(generateContainer)
        generateContainer.addSubview(nameLabel)
        generateContainer.addSubview(phoneNumberLabel)
        generateContainer.addSubview(salaryLabel)
        generateContainer.addSubview(emailLabel)
        
        employeeUIImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().offset(0)
        }
        
        generateContainer.snp.makeConstraints { make in
            make.top.equalTo(employeeUIImageView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.width.equalTo(50).offset(200)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
        }
        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom)
        }
          emailLabel.snp.makeConstraints { make in
              make.top.equalTo(salaryLabel.snp.bottom)
        }
        

        employeeUIImageView.image = UIImage(named: recivedemployeeImage ?? "")
        generateContainer.backgroundColor = .gray
        generateContainer.layer.cornerRadius = 10
        nameLabel.text = "Name: \(recivedfullName ?? "" )"
        salaryLabel.text = "Salary: \(recivedEmployeeSalary ?? "" )"
        phoneNumberLabel.text = "Phone: \(recivedPhoneNumber ?? "" )"
        emailLabel.text = "Email: \(recivedEmail ?? "" )"
        
        nameLabel.textColor = .white
        salaryLabel.textColor = .white
        phoneNumberLabel.textColor = .white
        emailLabel.textColor = .white
        
        nameLabel.font = .boldSystemFont(ofSize: 17)
        salaryLabel.font = .boldSystemFont(ofSize: 17)
        phoneNumberLabel.font = .boldSystemFont(ofSize: 17)
        emailLabel.font = .boldSystemFont(ofSize: 17)
    }
}
