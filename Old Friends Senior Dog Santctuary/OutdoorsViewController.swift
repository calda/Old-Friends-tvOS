//
//  OutdoorsViewController.swift
//  Old Friends
//
//  Created by Cal Stephens on 1/6/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import UIKit
import AVKit

class OutdoorsViewController: AVPlayerViewController {
    
    override func viewDidLoad() {
        let player = AVPlayer(url: Livestream.outdoors.url)
        self.player = player
        player.play()
    }
    
}
