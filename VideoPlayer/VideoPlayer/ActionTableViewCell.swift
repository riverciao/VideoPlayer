//
//  ActionTableViewCell.swift
//  VideoPlayer
//
//  Created by riverciao on 2018/1/19.
//  Copyright © 2018年 riverciao. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell, Identifiable {

    // MARK: Property
    
    static let height: CGFloat = 44.0
    
    class var identifier: String { return String(describing: self) }
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(origin: .zero, size: CGSize(width: 33, height: 19))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Play", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        button.addTarget(self, action: #selector(goToARButton), for: .touchUpInside)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
        setupPlayButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
        setupPlayButton()
    }
    
    // MARK: Set Up
    
    private func setUp() {
        
        self.contentView.backgroundColor = .orange
        
    }
    
    private func setupPlayButton() {
        contentView.addSubview(playButton)
        
        playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        playButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }

}
