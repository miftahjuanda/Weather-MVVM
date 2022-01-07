//
//  LabelComponent.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 06/01/22.
//

import UIKit

class LabelComponent: UILabel {

    private var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "---"
        label.numberOfLines = 0
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        backgroundView.addSubview(itemLabel)
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
            
            itemLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
        ])
    }

}
