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
    
    lazy var searchBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter URL of video"
        textField.font = UIFont(name: "ChalkboardSE-Regular", size: 14)
        textField.textColor = .black
        return textField
    }()
    
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
        
        self.contentView.backgroundColor = UIColor.black
        
        contentView.addSubview(searchBarView)
        
        searchBarView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        searchBarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        searchBarView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        searchBarView.addSubview(searchTextField)
        
        searchTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        searchTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }

}
