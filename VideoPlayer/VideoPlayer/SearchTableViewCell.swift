//
//  SearchTableViewCell.swift
//  VideoPlayer
//
//  Created by riverciao on 2018/1/19.
//  Copyright © 2018年 riverciao. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell, Identifiable {

    // MARK: Property
    
    class var identifier: String { return String(describing: self) }
    
    static let height: CGFloat = 44.0
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    // MARK: Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
        
    }
    
    // MARK: Set Up
    
    private func setUp() {
        
        self.contentView.backgroundColor = UIColor.blue
        
    }

}
