//
//  Videos.swift
//  bloom
//
//  Created by Star on 1/13/20.
//  Copyright © 2020 Star. All rights reserved.
//

import Foundation

struct Video {
    let lab1 : String
    let lab2 : String
    let videoFileName : String
    let thumbnailImage : String
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(lab1: "Smile", lab2: "Adjust your smile", videoFileName: "img_4230", thumbnailImage: "crown")
        let v2 = Video(lab1: "Eyes", lab2: "Open and close your eyes", videoFileName: "img_4244", thumbnailImage: "watermark")
        let v3 = Video(lab1: "Gender", lab2: "Change your gender", videoFileName: "img_4278", thumbnailImage: "crown")
        let v4 = Video(lab1: "Masculine", lab2: "Look more masculine", videoFileName: "img_4244", thumbnailImage: "watermark")
        var videos: [Video] = []
        videos.append(v1)
        videos.append(v2)
        videos.append(v3)
        videos.append(v4)
        return videos
    }

}
