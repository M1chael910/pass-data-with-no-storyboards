//
//  CarCell.swift
//  pass data with no storyboards
//
//  Created by Michael  Murphy on 12/2/18.
//  Copyright © 2018 Michael  Murphy. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    let nameLbl = UILabel()
    let yearLbl = UILabel()
    let brandLbl = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLbl)
        contentView.addSubview(yearLbl)
        contentView.addSubview(brandLbl)
        nameLbl.textAlignment = .center
        brandLbl.textAlignment = .center
        yearLbl.textAlignment = .center
        nameLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        brandLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        yearLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        brandLbl.translatesAutoresizingMaskIntoConstraints = false
        yearLbl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
