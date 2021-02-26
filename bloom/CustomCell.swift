//
//  CustomCell.swift
//  bloom
//
//  Created by Star on 1/12/20.
//  Copyright © 2020 Star. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCell: UITableViewCell, ASAutoPlayVideoLayerContainer {
       
    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var img: UIImageView!    

    var videoLayer: AVPlayerLayer = AVPlayerLayer()
    var videoURL: String? {
        didSet {
            if let videoURL = videoURL {
                ASVideoPlayerController.sharedVideoPlayer.setupVideoFor(url: videoURL)
            }
            videoLayer.isHidden = videoURL == nil
        }
    }
    
    var video : Video! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        videoLayer.backgroundColor = UIColor.clear.cgColor
        videoLayer.videoGravity = AVLayerVideoGravity.resize
        img.layer.addSublayer(videoLayer)
        img.image = getThumbnailFrom(url: Bundle.main.path(forResource: video.videoFileName, ofType: "mp4")!)
        
        lab1.text = video.lab1
        lab2.text = video.lab2
        videoURL = Bundle.main.path(forResource: video.videoFileName, ofType: "mp4")
    }
    
    override func prepareForReuse() {
        img.image = nil
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let horizontalMargin: CGFloat = 15
        let width: CGFloat = bounds.size.width - horizontalMargin * 2
        let height: CGFloat = width
        videoLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }

    func visibleVideoHeight() -> CGFloat {
        let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(img.frame, from: img)
        guard let videoFrame = videoFrameInParentSuperView,
            let superViewFrame = superview?.frame else {
             return 0
        }
        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        return visibleVideoFrame.size.height
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
