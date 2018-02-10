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
    
    // MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        if player == nil {
            setUpPlayer()
        } else {
            unpausePlayer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pausePlayer()
    }
    
    // MARK: Player setup
    
    private var timePaused: Date?
    
    func setUpPlayer() {
        livestream.play(in: self)
    }
    
    func pausePlayer() {
        timePaused = Date()
        
        player?.pause()
        showsPlaybackControls = false
    }
    
    func unpausePlayer() {
        guard let player = player else { return }
        
        // if the player has been paused (aka in the background) for more than 5 hours,
        // restart the player and refetch the livestream URL to prevent
        // the player from getting stuck on an outdated URL
        let timeSincePaused = Date().timeIntervalSince(timePaused ?? Date())
        if timeSincePaused > (5*60*60) {
            restartPlayer()
            return
        }
        
        if let live = player.currentItem?.seekableTimeRanges.last?.timeRangeValue {
            player.seek(to: live.start + live.duration)
        }
        
        player.play()
        
        self.showsPlaybackControls = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showsPlaybackControls = true
        }
    }
    
    func restartPlayer() {
        self.player = nil
        setUpPlayer()
    }
    
    // MARK: Subclass customization points
    
    var livestream: Livestream {
        fatalError("`livestream` must be implemented in the `LivestreamViewController` subclass.")
    }
    
}

