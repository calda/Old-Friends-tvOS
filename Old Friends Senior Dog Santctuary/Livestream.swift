//
//  Livestream.swift
//  Old Friends
//
//  Created by Cal Stephens on 1/6/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import UIKit
import AVKit

struct Livestream {
    
    static let indoors = Livestream("Indoors",
        at: "https://www.youtube.com/watch?v=1CnMUaokoSo")
    
    static let outdoors = Livestream("Outdoors",
        at: "https://www.youtube.com/watch?v=_msUij_PAxk")
    
    static let roverCam = Livestream("Rover Cam",
        at: "https://www.youtube.com/watch?v=v7WqF8s1aZs")
    
    // MARK: Instance
    
    let name: String
    private let urlString: String
    
    private init(_ name: String, at urlString: String) {
        self.name = name
        self.urlString = urlString
    }
    
    // MARK: URLs
    
    private var watchUrl: URL {
        return URL(string: urlString)!
    }
    
    private func getStreamUrl(completion: @escaping (URL?) -> Void) {
        HCYoutubeParser.h264videos(withYoutubeURL: watchUrl, complete: { dict, _ in
            
            guard let streamUrlPath = (dict?["live"] as? String)
                ?? dict?.values.first as? String else
            {
                DispatchQueue.main.async {
                    completion(nil)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                completion(URL(string: streamUrlPath))
            }
        })
    }
    
    // MARK: Playback
    
    func play(in viewController: AVPlayerViewController) {
        getStreamUrl  { streamUrl in
            
            guard let streamUrl = streamUrl else {
                let alertController = UIAlertController(
                    title: "Cound not load \(self.name) stream",
                    message: "The YouTube URL may have changed.",
                    preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                viewController.present(alertController, animated: true, completion: nil)
                return
            }
            
            let player = AVPlayer(url: streamUrl)
            viewController.player = player
            player.play()
        }
    }
    
}
