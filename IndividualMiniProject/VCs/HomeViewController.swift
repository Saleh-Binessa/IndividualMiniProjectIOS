import UIKit
import SnapKit

class HomeViewController: UIViewController ,UITextFieldDelegate{
    
    let fullNameTextField = UITextField()
    let imageTextField = UITextField()
    let employeeSalaryTextField = UITextField()
    let emailTextField = UITextField()
    let phoneNumberTextField = UITextField()
    let navigateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // Set a background color
        
        
        let appearance = UINavigationBarAppearance()
        title = "Login"
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        viewSubViewAdd()
        applyConstraints()
        setUpUI()
        
        
        // Add target action for the button
        navigateButton.addTarget(self, action: #selector(navigateButtonTapped), for: .touchUpInside)
        
        
        // Add target action for the button
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "exclamationmark"),
            style: .plain,
            target: self,
            action: #selector(InstructionsButton)
        )
    }
    func viewSubViewAdd(){
        view.addSubview(fullNameTextField)
        view.addSubview(imageTextField)
        view.addSubview(employeeSalaryTextField)
        view.addSubview(emailTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(navigateButton)
    }
    func applyConstraints(){
        navigateButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        fullNameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        imageTextField.snp.makeConstraints { make in
            make.top.equalTo(fullNameTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        employeeSalaryTextField.snp.makeConstraints { make in
            make.top.equalTo(imageTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(employeeSalaryTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
    }
    func setUpUI(){
        fullNameTextField.placeholder = "Enter Full Name"
        fullNameTextField.font = UIFont.systemFont(ofSize: 24)
        fullNameTextField.backgroundColor = .white
        fullNameTextField.textColor = .darkGray
        fullNameTextField.textAlignment = .center
        fullNameTextField.keyboardType = .default
        fullNameTextField.borderStyle = .roundedRect
        
        
        imageTextField.placeholder = "Enter Image Name"
        imageTextField.font = UIFont.systemFont(ofSize: 24)
        imageTextField.backgroundColor = .white
        imageTextField.textColor = .darkGray
        imageTextField.textAlignment = .center
        imageTextField.keyboardType = .default
        imageTextField.borderStyle = .roundedRect
        
        employeeSalaryTextField.placeholder = "Enter Salary"
        employeeSalaryTextField.font = UIFont.systemFont(ofSize: 24)
        employeeSalaryTextField.backgroundColor = .white
        employeeSalaryTextField.textColor = .darkGray
        employeeSalaryTextField.textAlignment = .center
        employeeSalaryTextField.keyboardType = .numberPad
        employeeSalaryTextField.borderStyle = .roundedRect
        
        
        emailTextField.placeholder = "Enter Email"
        emailTextField.font = UIFont.systemFont(ofSize: 24)
        emailTextField.backgroundColor = .white
        emailTextField.textColor = .darkGray
        emailTextField.textAlignment = .center
        emailTextField.keyboardType = .default
        emailTextField.borderStyle = .roundedRect
        
        
        phoneNumberTextField.placeholder = "Enter Phone Number"
        phoneNumberTextField.delegate = self
        phoneNumberTextField.font = UIFont.systemFont(ofSize: 24)
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.textColor = .darkGray
        phoneNumberTextField.textAlignment = .center
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.borderStyle = .roundedRect
        
        
        navigateButton.setTitle("Save Information", for: .normal)
        navigateButton.backgroundColor = .systemBlue
        navigateButton.layer.cornerRadius = 10
    }
    @objc func navigateButtonTapped() {
        let secondVC = EmployeeViewController()
        secondVC.recivedemployeeImage = imageTextField.text
        secondVC.recivedfullName = fullNameTextField.text
        secondVC.recivedEmail = emailTextField.text
        secondVC.recivedPhoneNumber = phoneNumberTextField.text
        secondVC.recivedEmployeeSalary = employeeSalaryTextField.text
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTextField {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 8
        }
        
        
        return true
    }
    @objc func InstructionsButton() {
        let instructionsVC = InstructionsViewController()
        instructionsVC.modalPresentationStyle = .formSheet
        instructionsVC.preferredContentSize = CGSize(width: 250, height: 340)
        self.present(instructionsVC, animated: true,completion: nil)
    }
}
