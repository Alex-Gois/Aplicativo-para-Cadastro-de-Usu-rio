import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    
    static var identifier: String = "TableViewCell"
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        return label
    }()
    
    lazy var titleEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail:"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(profileImage)
        contentView.addSubview(name)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(titleName)
        contentView.addSubview(titleEmail)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            
            titleName.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor,constant: -15),
            titleName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 20),
            
            titleEmail.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor,constant: 15),
            titleEmail.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: 20),
            
            name.centerYAnchor.constraint(equalTo: titleName.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: titleName.trailingAnchor,constant: 10),
            
            lastNameLabel.centerYAnchor.constraint(equalTo: titleName.centerYAnchor),
            lastNameLabel.leadingAnchor.constraint(equalTo: name.trailingAnchor,constant: 5),
            
            emailLabel.centerYAnchor.constraint(equalTo: titleEmail.centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: titleEmail.trailingAnchor,constant: 10),
            
            
        ])
    }
    
    public func setUpCell(profile: Profile) {
        self.profileImage.image = profile.imageProfile
        self.name.text = profile.firstName
        self.lastNameLabel.text = profile.lastName
        self.emailLabel.text = profile.email
    }
}
