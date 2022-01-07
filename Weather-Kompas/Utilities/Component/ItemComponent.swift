//
//  ItemComponent.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 06/01/22.
//

import UIKit

class ItemComponent: UIView {

    private var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .top
        stack.layoutIfNeeded()
        stack.distribution = .fillEqually
        stack.spacing = Constants.margin10
        return stack
    }()
    
    private var viewSatu: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Color-3")
        view.height(90)
        view.layer.cornerRadius = 4
        return view
    }()
    
    var imageSatu: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.tintColor = .white
        image.clipsToBounds = true
        return image
    }()
    
    var nameLabelSatu: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunrise"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    var descLabelSatu: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "--"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    private var viewDua: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Color-3")
        view.height(90)
        view.layer.cornerRadius = 4
        return view
    }()
    
    var imageDua: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.tintColor = .white
        image.clipsToBounds = true
        return image
    }()
    
    var nameLabelDua: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunrise"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    var descLabelDua: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "--"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    var viewTiga: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Color-3")
        view.height(90)
        view.layer.cornerRadius = 4
        return view
    }()
    
    var imageTiga: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.tintColor = .white
        image.clipsToBounds = true
        return image
    }()
    
    var nameLabelTiga: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunrise"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    var descLabelTiga: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "--"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        backgroundView.addSubview(horizontalStackView)
        
        horizontalStackView.addSubview(viewSatu)
        viewSatu.addSubview(imageSatu)
        viewSatu.addSubview(nameLabelSatu)
        viewSatu.addSubview(descLabelSatu)
        
        horizontalStackView.addSubview(viewDua)
        viewDua.addSubview(imageDua)
        viewDua.addSubview(nameLabelDua)
        viewDua.addSubview(descLabelDua)
        
        horizontalStackView.addSubview(viewTiga)
        viewTiga.addSubview(imageTiga)
        viewTiga.addSubview(nameLabelTiga)
        viewTiga.addSubview(descLabelTiga)
        
        horizontalStackView.addArrangedSubview(viewSatu)
        horizontalStackView.addArrangedSubview(viewDua)
        horizontalStackView.addArrangedSubview(viewTiga)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.frame = bounds
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            
            imageSatu.topAnchor.constraint(equalTo: viewSatu.topAnchor, constant: Constants.margin10),
            imageSatu.centerXAnchor.constraint(equalTo: viewSatu.centerXAnchor),
            
            nameLabelSatu.topAnchor.constraint(equalTo: imageSatu.bottomAnchor),
            nameLabelSatu.leadingAnchor.constraint(equalTo: viewSatu.leadingAnchor, constant: Constants.margin5),
            nameLabelSatu.trailingAnchor.constraint(equalTo: viewSatu.trailingAnchor, constant: -Constants.margin5),
            
            descLabelSatu.topAnchor.constraint(equalTo: nameLabelSatu.bottomAnchor),
            descLabelSatu.leadingAnchor.constraint(equalTo: viewSatu.leadingAnchor, constant: Constants.margin5),
            descLabelSatu.trailingAnchor.constraint(equalTo: viewSatu.trailingAnchor, constant: -Constants.margin5),
            descLabelSatu.bottomAnchor.constraint(equalTo: viewSatu.bottomAnchor, constant: -Constants.margin10),
            
            
            imageDua.topAnchor.constraint(equalTo: viewDua.topAnchor, constant: Constants.margin10),
            imageDua.centerXAnchor.constraint(equalTo: viewDua.centerXAnchor),
            
            nameLabelDua.topAnchor.constraint(equalTo: imageDua.bottomAnchor),
            nameLabelDua.leadingAnchor.constraint(equalTo: viewDua.leadingAnchor, constant: Constants.margin5),
            nameLabelDua.trailingAnchor.constraint(equalTo: viewDua.trailingAnchor, constant: -Constants.margin5),
            
            descLabelDua.topAnchor.constraint(equalTo: nameLabelDua.bottomAnchor),
            descLabelDua.leadingAnchor.constraint(equalTo: viewDua.leadingAnchor, constant: Constants.margin5),
            descLabelDua.trailingAnchor.constraint(equalTo: viewDua.trailingAnchor, constant: -Constants.margin5),
            descLabelDua.bottomAnchor.constraint(equalTo: viewDua.bottomAnchor, constant: -Constants.margin10),
            
            
            imageTiga.topAnchor.constraint(equalTo: viewTiga.topAnchor, constant: Constants.margin10),
            imageTiga.centerXAnchor.constraint(equalTo: viewTiga.centerXAnchor),
            
            nameLabelTiga.topAnchor.constraint(equalTo: imageTiga.bottomAnchor, constant: Constants.margin5),
            nameLabelTiga.leadingAnchor.constraint(equalTo: viewTiga.leadingAnchor, constant: Constants.margin5),
            nameLabelTiga.trailingAnchor.constraint(equalTo: viewTiga.trailingAnchor, constant: -Constants.margin5),
            
            descLabelTiga.topAnchor.constraint(equalTo: nameLabelTiga.bottomAnchor, constant: Constants.margin5),
            descLabelTiga.leadingAnchor.constraint(equalTo: viewTiga.leadingAnchor, constant: Constants.margin5),
            descLabelTiga.trailingAnchor.constraint(equalTo: viewTiga.trailingAnchor, constant: -Constants.margin5),
            descLabelTiga.bottomAnchor.constraint(equalTo: viewTiga.bottomAnchor, constant: -Constants.margin10),
            
        ])
    }

}
