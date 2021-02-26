//
//  SecondViewController.swift
//  bloom
//
//  Created by Star on 1/10/20.
//  Copyright © 2020 Star. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mBorder: UIImageView!
    @IBOutlet weak var yBorder: UIImageView!
    @IBOutlet weak var mCheck: UIImageView!
    @IBOutlet weak var yCheck: UIImageView!
    var videos: [Video] = Video.fetchVideos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickMView(_ sender: Any) {
        mBorder.isHidden = false
        mCheck.isHidden = false
        yBorder.isHidden = true
        yCheck.isHidden = true
    }
    
    @IBAction func clickYView(_ sender: Any) {
        mBorder.isHidden = true
        mCheck.isHidden = true
        yBorder.isHidden = false
        yCheck.isHidden = false
    }
    
    var xOffset: CGFloat = 0

    @objc func timerAction() {

        xOffset += 20
        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveLinear, animations: {
                self.collectionView.contentOffset.x = self.xOffset
            }) { (finished) in }
        }
    }
    
}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count * 1000
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            let video = videos[indexPath.row % videos.count]
            cell.video = video
            
            return cell
        }
        return UICollectionViewCell()
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        self.xOffset = collectionView.contentOffset.x
//    }

}
