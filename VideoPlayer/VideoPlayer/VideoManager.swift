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
    
    init(isPlayed: Bool) {
        
        super.init()
        
        self.isPlayed = isPlayed
        
    }
    
}

private var videoContext = 0

class VideoManager: NSObject {
    
    var videoStatus: VideoStatus
    
    init(videoStatus: VideoStatus) {
        self.videoStatus = videoStatus
        
        super.init()
        
        self.videoStatus.addObserver(self, forKeyPath: #keyPath(VideoStatus.isPlayed), options: .new, context: &videoContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &videoContext {
            
            print("value have changed!!!!!!")
            
        }
        
    }
    
}
