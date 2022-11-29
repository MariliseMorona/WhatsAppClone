//
//  ChatTableViewCell.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 29/11/22.
//

import UIKit

struct ChatModel {
    var title: String
    var message: String
    var date: String
    var numb: String
    var image: String
}

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatTableViewCell"
    
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
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
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
    lazy var stackViewUser : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelTitle, labelMessage])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 3
        return stack
    }()
    lazy var labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User name or Group name"
        return label
    }()
    lazy var labelMessage : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ultima mensagem recebida"
        return label
    }()
    lazy var stackStatus : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imgInfo, countView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    lazy var imgInfo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "info")
        return image
    }()
    lazy var countView : UITextView = {
       let view = UITextView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.text = ""
        return view
    }()
    lazy var stackViewHour : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelDate, stackStatus])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    lazy var labelDate : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User name or Group name"
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
        containerView.addSubview(stackViewUser)
        containerView.addSubview(stackViewHour)
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
            
            stackViewUser.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackViewUser.leadingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: 10),
            stackViewUser.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            stackViewHour.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackViewHour.leadingAnchor.constraint(equalTo: stackViewUser.trailingAnchor, constant: 10),
            stackViewHour.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            stackViewHour.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            labelDate.heightAnchor.constraint(equalToConstant: 20),
            imgInfo.heightAnchor.constraint(equalToConstant: 20),
            imgInfo.widthAnchor.constraint(equalToConstant: 20),
            countView.heightAnchor.constraint(equalToConstant: 20),
            countView.widthAnchor.constraint(equalToConstant: 20),
            
            
        ])
        
    }
    var populate: ChatModel? {
        didSet{
            guard let populate = populate else {  return }
            labelTitle.text = populate.title
            labelDate.text = populate.date
            labelMessage.text = populate.message
            countView.text = populate.numb
            uiImageView.image = UIImage(named: populate.image)
        }
    }
}

