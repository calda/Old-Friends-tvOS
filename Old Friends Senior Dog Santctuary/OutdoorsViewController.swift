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
        Livestream.outdoors.play(in: self)
    }
    
}
