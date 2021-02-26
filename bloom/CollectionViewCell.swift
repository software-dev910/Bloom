//
//  CollectionViewCell.swift
//  bloom
//
//  Created by Star on 1/13/20.
//  Copyright © 2020 Star. All rights reserved.
//

import UIKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lab: UILabel!
    
    var video : Video! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        img.image = getThumbnailFrom(url: Bundle.main.path(forResource: video.videoFileName, ofType: "mp4")!)
        lab.text = video.lab1
    }
    
    func getThumbnailFrom(url: String) -> UIImage? {

        do {

            let asset = AVURLAsset(url: URL(fileURLWithPath: url))
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)

            return thumbnail

        } catch let error {

            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil

        }

    }
}
