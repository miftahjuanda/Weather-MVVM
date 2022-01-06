//
//  WeatherViewController.swift
//  Weather-Kompas
//
//  Created by Miftah Juanda Batubara on 06/01/22.
//

import UIKit
import TinyConstraints

class WeatherViewController: UIViewController {
    
    private var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
//        refresh.addTarget(self, action: #selector(refreshAction(sender:)), for: .valueChanged)
        return refresh
    }()
    
    // create scroll view
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = true
        return scroll
    }()
    
    private var contentView: UIView = {
        let backview = UIView()
        backview.translatesAutoresizingMaskIntoConstraints = false
        backview.backgroundColor = UIColor.clear
        return backview
    }()
    
    private var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .top
        stack.layoutIfNeeded()
        stack.distribution = .fillEqually
        stack.spacing = 30
        return stack
    }()
    
    private var cityLabel = LabelComponent()
    private var updateLabel = LabelComponent()
    private var weatherLabel = LabelComponent()
    private var celciusLabel = LabelComponent()
    private var minLabel = LabelComponent()
    private var maxLabel = LabelComponent()
    
    
    private var itemWeatherTop = ItemComponent()
    private var itemWeatherBott = ItemComponent()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComponentView()
        setConstraintView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(named: "Color-1")?.cgColor, UIColor(named: "Color-2")?.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
    
    private func setComponentView() {
        //set scrollview to View dan contentView diatas layer scrollview
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(cityLabel)
        cityLabel.itemLabel.text = "Kota Batam"
        cityLabel.itemLabel.font = UIFont.systemFont(ofSize: 24)
        cityLabel.itemLabel.textAlignment = .center
        
        
        contentView.addSubview(updateLabel)
        updateLabel.itemLabel.text = "Update at: ---------"
        updateLabel.itemLabel.font = UIFont.systemFont(ofSize: 14)
        updateLabel.itemLabel.textAlignment = .center

        contentView.addSubview(weatherLabel)
        weatherLabel.itemLabel.text = "Haze"
        weatherLabel.itemLabel.font = UIFont.systemFont(ofSize: 16)
        weatherLabel.itemLabel.textAlignment = .center

        contentView.addSubview(celciusLabel)
        celciusLabel.itemLabel.text = "27'' C "
        celciusLabel.itemLabel.font = UIFont.systemFont(ofSize: 54)
        celciusLabel.itemLabel.textAlignment = .center

        contentView.addSubview(horizontalStackView)
        horizontalStackView.addSubview(minLabel)
        minLabel.itemLabel.text = "Min Temp: 27'' C "
        minLabel.itemLabel.font = UIFont.systemFont(ofSize: 14)
        minLabel.itemLabel.textAlignment = .right

        horizontalStackView.addSubview(maxLabel)
        maxLabel.itemLabel.text = "Min Temp: 27'' C "
        maxLabel.itemLabel.font = UIFont.systemFont(ofSize: 14)
        maxLabel.itemLabel.textAlignment = .left

        horizontalStackView.addArrangedSubview(minLabel)
        horizontalStackView.addArrangedSubview(maxLabel)

        contentView.addSubview(itemWeatherTop)
        contentView.addSubview(itemWeatherBott)

    }
    
    
    private func setConstraintView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityLabel.height(25),
             
            
            updateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: Constants.margin5),
            updateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            updateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            updateLabel.height(20),
            
            weatherLabel.topAnchor.constraint(equalTo: updateLabel.bottomAnchor, constant: 200),
            weatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weatherLabel.height(20),
            
            celciusLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: Constants.margin5),
            celciusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            celciusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            celciusLabel.height(60),
            
            
            horizontalStackView.topAnchor.constraint(equalTo: celciusLabel.bottomAnchor, constant: Constants.margin5),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            itemWeatherTop.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 130),
            itemWeatherTop.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.margin10),
            itemWeatherTop.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.margin10),
            itemWeatherTop.height(90),

            itemWeatherBott.topAnchor.constraint(equalTo: itemWeatherTop.bottomAnchor, constant: Constants.margin10),
            itemWeatherBott.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.margin10),
            itemWeatherBott.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.margin10),
            itemWeatherBott.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            itemWeatherBott.height(90),
            
        ])
    }
    
}
