//
//  IndoorsViewController.swift
//  Old Friends
//
//  Created by Cal Stephens on 1/6/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import UIKit
import AVKit

class IndoorsViewController: AVPlayerViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if let player = player {
            player.play()
            player.seek(to: Date())
        } else {
            Livestream.indoors.play(in: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
    }
    
}
