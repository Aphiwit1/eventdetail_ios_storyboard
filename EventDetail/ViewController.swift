//
//  ViewController.swift
//  EventDetail
//
//  Created by AphiwitSCB on 22/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mDeleteButton: UIButton!
    
    @IBOutlet weak var mUIView1: UIView!
    @IBOutlet weak var mUIView2: UIView!
    @IBOutlet weak var mUIView3: UIView!
    
    @IBOutlet weak var mLabelDescription: UILabel!
    
    var data = ["girl","girl","girl","girl","girl"]

    override func viewDidLoad() {
        super.viewDidLoad()

        mUIView1.layer.cornerRadius = 8
        mUIView2.layer.cornerRadius = 8
        mUIView3.layer.cornerRadius = 8

        mDeleteButton.layer.borderColor = UIColor.red.cgColor
        mDeleteButton.layer.borderWidth = 2
        mDeleteButton.layer.cornerRadius = 8
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! showCollectionViewCell
        
//        let text = cell.mLabel.text
//        cell.mLabel.text = "\(data[0])"
        cell.mImageView.image = UIImage(named: data[0])
        
        return cell
    }
    
   
    
    
    


}

