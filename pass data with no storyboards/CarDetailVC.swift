//
//  CarDetailVC.swift
//  pass data with no storyboards
//
//  Created by Michael  Murphy on 12/2/18.
//  Copyright © 2018 Michael  Murphy. All rights reserved.
//

import UIKit

class CarDetailVC: UIViewController {

    
    let carNameLbl = UILabel()
    let carYearLbl = UILabel()
    let carBrandLbl = UILabel()
    var passedCar: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarLabels()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if passedCar != nil {
            carNameLbl.text = passedCar.name
            carBrandLbl.text = passedCar.brand
            carYearLbl.text = String(passedCar.year)
        } else {
            print("ERROR")
        }
    }
    
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setupCarLabels() {
        let stackView = UIStackView(arrangedSubviews: [carNameLbl,carYearLbl,carBrandLbl])
        view.addSubview(stackView)
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: stackView, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 40).isActive = true

        let CenterXConstraint = NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    }


}
