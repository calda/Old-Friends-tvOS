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
    
    override func viewDidLoad() {
        Livestream.indoors.play(in: self)
    }
    
}
