//
//  VideoPlayerTableViewController.swift
//  VideoPlayer
//
//  Created by riverciao on 2018/1/19.
//  Copyright © 2018年 riverciao. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class VideoPlayerTableViewController: UITableViewController {

    enum Component {
        
        case search, video, action
        
    }
    
    // MARK: - Property
    
    private let components: [Component] = [ .search, .video, .action ]
    
    private var player: AVPlayer?
    
    private var playerStatusContext = 0
    
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
            
            cell.searchTextField.addTarget(self, action: #selector(playVideo), for: .editingDidEnd)
            
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
            
            cell.playButton.addTarget(self, action: #selector(pauseOrPlay), for: .touchUpInside)
            
            cell.muteButton.addTarget(self, action: #selector(mute), for: .touchUpInside)
            
            return cell
        }
        
    }
    
    // MARK: Feature
    
    @objc private func playVideo() {
        // Get video URL
        let path = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
        let url = URL(string: path)
        player = AVPlayer(url: url!)
        
        // Present the video player VC and play video
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // Setup vedio frame
        self.addChildViewController(playerViewController)
        let width = UIScreen.main.bounds.width
        let x: CGFloat = 0
        let y = UIScreen.main.bounds.height / 2
        playerViewController.view.frame = CGRect(x: x, y: y, width: width, height: 300)
        
        self.view.addSubview(playerViewController.view)
        player!.play()
        
        player!.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: &playerStatusContext)

    }
    
    @objc private func pauseOrPlay() {
        
        player?.pause()
        
    }
    
    @objc private func mute() {
        
        player?.isMuted = true
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        print("OOOOOO\(change)")
        //  Check status
//        if keyPath == "status" && context == &playerStatusContext && change != nil
//        {
//            let status = change![.newKey] as! Int
////            let status = AVPlayerStatus(rawValue: change![.newKey] as! Int)!
//            //  Status is not unknown
//            if(status != AVPlayerStatus.unknown.rawValue)
//            {
//                print("KVO detect3902")
//            }
//        }
    }

}
