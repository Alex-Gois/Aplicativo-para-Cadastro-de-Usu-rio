
import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private let imagePicker: UIImagePickerController = UIImagePickerController()
    private var profile: [Profile] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
        homeScreen?.delegate(self)
        homeScreen?.configProtocolTableView(delegate: self, dataSource: self)
        homeScreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func validateAddButton() {
        
        //MARK: validação dos campos textField.
        let name: String = homeScreen?.nameTextField.text ?? ""
        let lastName: String = homeScreen?.lastNameTextField.text ?? ""
        let email: String = homeScreen?.emailTextField.text ?? ""
        let password: String = homeScreen?.passwordTextField.text ?? ""
        let image: UIImage = homeScreen?.profileImage.image ?? UIImage()
        
        if !name.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && image != UIImage(systemName: "person.circle.fill") {
            homeScreen?.addButton.setTitleColor(UIColor.white, for: .normal)
            homeScreen?.addButton.isEnabled = true
        } else {
            homeScreen?.addButton.setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)
            homeScreen?.addButton.isEnabled = false
        }
    }
}

//MARK: Extension de delegate do TextField.
extension HomeVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0
        validateAddButton()
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

//MARK: Extension da HomeScreen.
extension HomeVC: HomeScreenProtocol {
    func tappedEditImageButton() {
        print("Chegou na VC")
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func TappedAddButton() {
        print("Chegou na VC1")
        profile.append(Profile(imageProfile: homeScreen?.profileImage.image ?? UIImage()  , firstName: homeScreen?.nameTextField.text ?? "", lastName: homeScreen?.lastNameTextField.text ?? "", email: homeScreen?.emailTextField.text ?? ""))
        homeScreen?.nameTextField.text = ""
        homeScreen?.lastNameTextField.text = ""
        homeScreen?.emailTextField.text = ""
        homeScreen?.passwordTextField.text = ""
        homeScreen?.profileImage.image = UIImage(systemName: "person.circle.fill")
        homeScreen?.tableView.reloadData()
        
    }
}

//MARK: Extension da PickerController.
extension HomeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            homeScreen?.profileImage.image = image
            homeScreen?.profileImage.layer.borderColor = UIColor.black.cgColor
            homeScreen?.profileImage.layer.cornerRadius = (homeScreen?.profileImage.frame.height ?? CGFloat()) / 2
            homeScreen?.profileImage.clipsToBounds = true
            homeScreen?.profileImage.contentMode = .scaleAspectFill
        }
        picker.dismiss(animated: true)
    }
}

//MARK: Extension da TableView.
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell? = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.setUpCell(profile: profile[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
