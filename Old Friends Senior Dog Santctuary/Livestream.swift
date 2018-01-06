//
//  Livestream.swift
//  Old Friends
//
//  Created by Cal Stephens on 1/6/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import Foundation

struct Livestream {
    
    static let indoors = Livestream("Indoors",
        at: "https://manifest.googlevideo.com/api/manifest/hls_variant/key/yt6/signature/632CE7322BD94B52549FC942C809A8F4F910B636.90BF2721768CDCBB7664CF71E43C142344ED4595/expire/1515293516/gcr/us/ratebypass/yes/maudio/1/keepalive/yes/id/1CnMUaokoSo.1/ei/7DZRWtm6E6GXkATU4SE/go/1/requiressl/yes/itag/0/playlist_type/DVR/sparams/ei,gcr,go,hfr,id,ip,ipbits,itag,maudio,playlist_type,ratebypass,requiressl,source,expire/dover/8/source/yt_live_broadcast/ip/68.234.129.38/hfr/1/ipbits/0/file/index.m3u8")
    
    static let outdoors = Livestream("Outdoors",
        at: "https://manifest.googlevideo.com/api/manifest/hls_variant/gcr/us/itag/0/tx/9486108/id/_msUij_PAxk.1/requiressl/yes/signature/CF62DBC71A071D129471B53BF9D65B67579B699A.28D6B7A34F44079A79AE483D6E684A6116BEC137/source/yt_live_broadcast/dover/8/playlist_type/DVR/keepalive/yes/expire/1515294139/ratebypass/yes/ip/68.234.129.38/key/yt6/maudio/1/hfr/1/sparams/ei,gcr,go,hfr,id,ip,ipbits,itag,maudio,playlist_type,ratebypass,requiressl,source,tx,txs,expire/txs/9486106,9486107,9486108,9486113,9486114/ipbits/0/go/1/ei/WzlRWsOUI8XCkAPMmK_4CQ/file/index.m3u8")
    
    // MARK: Instance
    
    let name: String
    private let urlString: String
    
    var url: URL {
        return URL(string: urlString)!
    }
    
    private init(_ name: String, at urlString: String) {
        self.name = name
        self.urlString = urlString
    }
    
}
