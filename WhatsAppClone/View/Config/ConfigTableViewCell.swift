//
//  ConfigTableViewCell.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 01/12/22.
//

import UIKit

struct ConfigModel {
    var title: String
    var image: String
}

class ConfigTableViewCell: UITableViewCell {

    static let identifier = "ConfigTableViewCell"
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    lazy var uiImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        return image
    }()
    lazy var labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User name or Group name"
        return label
    }()
    lazy var imgInfo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrowNext")
        return image
    }()
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setUp(){
        addSubview(containerView)
        containerView.addSubview(uiImageView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(imgInfo)
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            uiImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            uiImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            uiImageView.heightAnchor.constraint(equalToConstant: 40),
            uiImageView.widthAnchor.constraint(equalToConstant: 40),
            uiImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            labelTitle.topAnchor.constraint(equalTo: uiImageView.topAnchor),
            labelTitle.bottomAnchor.constraint(equalTo: uiImageView.bottomAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: uiImageView.trailingAnchor, constant: 10),
            
            imgInfo.centerYAnchor.constraint(equalTo: labelTitle.centerYAnchor),
            imgInfo.leadingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: 10),
            imgInfo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imgInfo.heightAnchor.constraint(equalToConstant: 10),
            imgInfo.widthAnchor.constraint(equalToConstant: 5)
        ])
        
    }
    var populate: ConfigModel? {
        didSet{
            guard let populate = populate else {  return }
            labelTitle.text = populate.title
            uiImageView.image = UIImage(named: populate.image)
        }
    }
}


