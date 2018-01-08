//
//  LivestreamViewController.swift
//  Old Friends
//
//  Created by Cal Stephens on 1/7/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import UIKit
import AVKit

class LivestreamViewController: AVPlayerViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if let player = player {
            if let live = player.currentItem?.seekableTimeRanges.last?.timeRangeValue {
                player.seek(to: live.start + live.duration)
            }
            
            player.play()
            
            self.showsPlaybackControls = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showsPlaybackControls = true
            }
            
        } else {
            livestream.play(in: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        showsPlaybackControls = false
    }
    
    // MARK: Subclass customization points
    
    var livestream: Livestream {
        fatalError("`livestream` must be implemented in the `LivestreamViewController` subclass.")
    }
    
}

