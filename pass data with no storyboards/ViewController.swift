//
//  ViewController.swift
//  pass data with no storyboards
//
//  Created by Michael  Murphy on 12/1/18.
//  Copyright © 2018 Michael  Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var carList: [Car] = [Car(year: 2019, name: "Model-3", brand: "Tesla")]
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarCell.self, forCellReuseIdentifier: "carCell")
        view.backgroundColor = .darkGray
        
    }
    
    func addTableViewConstraints() {
        let top = NSLayoutConstraint(item: tableView, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        let bottom = NSLayoutConstraint(item: tableView, attribute: .bottomMargin, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant:0).isActive = true
        let trailing = NSLayoutConstraint(item: tableView, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        let leading = NSLayoutConstraint(item: tableView, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addTableViewConstraints()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CarCell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as? CarCell else {return UITableViewCell()}
        cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cell.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        cell.backgroundColor = .darkGray
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0 , width: cell.frame.width, height: cell.frame.height))
        cell.addSubview(stackView)
        stackView.backgroundColor = .clear
        stackView.addArrangedSubview(cell.brandLbl)
        stackView.addArrangedSubview(cell.nameLbl)
        stackView.addArrangedSubview(cell.yearLbl)
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewLeadingConstraint = NSLayoutConstraint(item: stackView, attribute: .leadingMargin, relatedBy: .equal, toItem: cell, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        let stackViewTrailingConstraint = NSLayoutConstraint(item: stackView, attribute: .trailingMargin, relatedBy: .equal, toItem: cell, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        let stackViewTopConstraint = NSLayoutConstraint(item: stackView, attribute: .topMargin, relatedBy: .equal, toItem: cell, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        let stackViewBottomConstraint = NSLayoutConstraint(item: stackView, attribute: .bottomMargin, relatedBy: .equal, toItem: cell, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
        cell.nameLbl.text = carList[indexPath.row].name
        cell.brandLbl.text = carList[indexPath.row].brand
        cell.yearLbl.text = String(carList[indexPath.row].year)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carDetailScreen = CarDetailVC()
        let selectedCar = carList.first
        carDetailScreen.view.backgroundColor = .darkGray
        carDetailScreen.passedCar = selectedCar
        
        navigationController?.pushViewController(carDetailScreen, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
}



