import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedEditImageButton()
    func TappedAddButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(_ delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 150
        image.setShadow()
        return image
    }()
    
    lazy var editImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar Foto", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setShadow()
        button.addTarget(self, action: #selector(tappedEditImageButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nameTextField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.autocorrectionType = .no
        tx.keyboardType = .default
        tx.placeholder = "nome"
        tx.backgroundColor = .white
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 8
        tx.borderStyle = .roundedRect
        tx.setShadow()
        return tx
        
    }()
    
    lazy var lastNameTextField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.autocorrectionType = .no
        tx.keyboardType = .default
        tx.placeholder = "Sobrenome"
        tx.backgroundColor = .white
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 8
        tx.borderStyle = .roundedRect
        tx.setShadow()
        return tx
        
    }()
    
    lazy var emailTextField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.autocorrectionType = .no
        tx.keyboardType = .emailAddress
        tx.placeholder = "exemplo@gmail.com"
        tx.backgroundColor = .white
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 8
        tx.borderStyle = .roundedRect
        tx.setShadow()
        return tx
    }()
    
    lazy var passwordTextField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.autocorrectionType = .no
        tx.keyboardType = .default
        tx.isSecureTextEntry = true
        tx.placeholder = "senha "
        tx.backgroundColor = .white
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 8
        tx.borderStyle = .roundedRect
        tx.setShadow()
        return tx
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.4), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.isEnabled = false
        button.setShadow()
        button.addTarget(self, action: #selector(TappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedEditImageButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedEditImageButton()
    }
    
    @objc func TappedAddButton(_ sender: UIButton) {
        print("Botão funcionandoooo")
        delegate?.TappedAddButton()
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return table
    }()
    
    public func configProtocolTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        lastNameTextField.delegate = delegate
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 95/255, green: 158/255, blue: 160/255, alpha: 1.0)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(profileImage)
        addSubview(editImageButton)
        addSubview(nameTextField)
        addSubview(lastNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(addButton)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            
            
            editImageButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 20),
            editImageButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            editImageButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            editImageButton.heightAnchor.constraint(equalToConstant: 30),
            
            nameTextField.topAnchor.constraint(equalTo: editImageButton.bottomAnchor,constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: editImageButton.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 170),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            lastNameTextField.topAnchor.constraint(equalTo: editImageButton.bottomAnchor,constant: 25),
            lastNameTextField.trailingAnchor.constraint(equalTo: editImageButton.trailingAnchor),
            lastNameTextField.widthAnchor.constraint(equalToConstant: 170),
            lastNameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor,constant: 17),
            emailTextField.leadingAnchor.constraint(equalTo: editImageButton.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: editImageButton.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 17),
            passwordTextField.leadingAnchor.constraint(equalTo: editImageButton.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: editImageButton.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            addButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            addButton.leadingAnchor.constraint(equalTo: editImageButton.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: editImageButton.trailingAnchor),
            addButton.heightAnchor.constraint(equalTo: editImageButton.heightAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 320),
            
        ])
    }
    
}

