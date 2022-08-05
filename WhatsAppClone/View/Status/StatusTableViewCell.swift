//
//  StatusTableViewCell.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 04/08/22.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    static let identifier = "StatusTableViewCell"
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var uiView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    lazy var uiImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        return image
    }()
    
    lazy var labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User name or Group name"
        return label
    }()
    
    lazy var labelHour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hour"
        return label
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
        containerView.addSubview(uiView)
        uiView.addSubview(uiImageView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(labelHour)
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            uiView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            uiView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            uiView.heightAnchor.constraint(equalToConstant: 40),
            uiView.widthAnchor.constraint(equalTo: uiView.heightAnchor),
            uiView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            uiImageView.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 2),
            uiImageView.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -2),
            uiImageView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -2),
            uiImageView.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 2),
            
            labelTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            labelTitle.leadingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 10),
//            labelTitle.heightAnchor.constraint(equalToConstant: 5),
            
            labelHour.topAnchor.constraint(equalTo: labelTitle.topAnchor),
            labelHour.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelHour.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
            
        ])
        
    }
    var populate: Model? {
        didSet{
            guard let populate = populate else {  return }
            labelTitle.text = populate.title
            labelHour.text = populate.hour
        }
    }
}
