//
//  VideoPlayerTableViewController.swift
//  VideoPlayer
//
//  Created by riverciao on 2018/1/19.
//  Copyright © 2018年 riverciao. All rights reserved.
//

import UIKit

class VideoPlayerTableViewController: UITableViewController {

    enum Component {
        
        case search, video, action
        
    }
    
    // MARK: - Property
    
    private let components: [Component] = [ .search, .video, .action ]
    
    // MARK: - View lifr cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
    }
    
    // MARK: Init
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Set Up
    
    private func setUp() {
        
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = UIColor.black
        tableView.separatorStyle = .none

        tableView.register(
            SearchTableViewCell.self,
            forCellReuseIdentifier: SearchTableViewCell.identifier
        )
        
        tableView.register(
            VideoTableViewCell.self,
            forCellReuseIdentifier: VideoTableViewCell.identifier
        )
        
        tableView.register(
            ActionTableViewCell.self,
            forCellReuseIdentifier: ActionTableViewCell.identifier
        )
        
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return components.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch components[section] {
        case .search, .video, .action:
            
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44.0
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch components[indexPath.section] {
        case .search:
            
            return SearchTableViewCell.height
            
        case .video:
            
            let actionRowHeight = ActionTableViewCell.height
            
            var topHeight: CGFloat = view.safeAreaInsets.top
            
            if let navigationController = navigationController {
                
                let navigationBar = navigationController.navigationBar
                
                topHeight -= (navigationBar.frame.origin.y + navigationBar.bounds.height)
                
            }
            
            let height = view.bounds.height
                - topHeight
                - actionRowHeight
            
            let minimumHeight = VideoTableViewCell.height
            
            if height < minimumHeight { return minimumHeight }
            
            return height
            
        case .action:
            
            return ActionTableViewCell.height
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let component = components[indexPath.section]
        
        switch component {
        case .search:
            
            let identifier = SearchTableViewCell.identifier
            
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SearchTableViewCell
            // swiftlint:enable force_case
            
            cell.selectionStyle = .none
            
            return cell
            
        case .video:
            
            let identifier = VideoTableViewCell.identifier
            
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! VideoTableViewCell
            // swiftlint:enable force_case
            
            cell.selectionStyle = .none
            
            return cell
            
        case .action:
            
            let identifier = ActionTableViewCell.identifier
            
            // swiftlint:disable force_cast
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ActionTableViewCell
            // swiftlint:enable force_case
            
            cell.selectionStyle = .none
            
            return cell
        }
        
    }

}
