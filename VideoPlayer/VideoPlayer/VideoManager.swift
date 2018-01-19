//
//  VideoManager.swift
//  VideoPlayer
//
//  Created by riverciao on 2018/1/19.
//  Copyright © 2018年 riverciao. All rights reserved.
//

import Foundation

class VideoStatus: NSObject {
    
    @objc dynamic var isPlayed: Bool = false
    
    @objc dynamic var isMuted: Bool = false
    
    init(isPlayed: Bool, isMuted: Bool) {

        super.init()
        
        self.isPlayed = isPlayed
        
        self.isMuted = isMuted
        
    }
    
}

private var playContext = 0

private var muteContext = 0

class VideoManager: NSObject {
    
    var videoStatus: VideoStatus
    
    init(videoStatus: VideoStatus) {
        self.videoStatus = videoStatus
        
        super.init()
        
        self.videoStatus.addObserver(self, forKeyPath: #keyPath(VideoStatus.isPlayed), options: .new, context: &playContext)
        
        self.videoStatus.addObserver(self, forKeyPath: #keyPath(VideoStatus.isMuted), options: .new, context: &muteContext)

    }
    
    deinit {
        
        videoStatus.removeObserver(self, forKeyPath: #keyPath(VideoStatus.isPlayed))
        
        videoStatus.removeObserver(self, forKeyPath: #keyPath(VideoStatus.isMuted))
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &playContext {
            
            print("play condition has changed!!!!!!")
            
        }
        
        if context == &muteContext {
            
            print("mute condition has changed!!!!!!")
            
        }
        
    }
    
}
