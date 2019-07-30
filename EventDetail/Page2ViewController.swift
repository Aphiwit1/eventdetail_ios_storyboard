//
//  Page2ViewController.swift
//  EventDetail
//
//  Created by AphiwitSCB on 28/7/2562 BE.
//  Copyright © 2562 OnceKB. All rights reserved.
//

import UIKit
import Alamofire

class Page2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mDeleteButton: UIButton!
    
    @IBOutlet weak var mUIView1: UIView!
    @IBOutlet weak var mUIView2: UIView!
    @IBOutlet weak var mUIView3: UIView!
    
    @IBOutlet weak var mLabelDescription: UILabel!
    
    @IBOutlet weak var mDayMMYY: UILabel!
    @IBOutlet weak var mTime: UILabel!
    @IBOutlet weak var mLocation: UILabel!
    
    var data = ["girl","girl","girl","girl","girl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedData()
        
        mUIView1.layer.cornerRadius = 8
        mUIView2.layer.cornerRadius = 8
        mUIView3.layer.cornerRadius = 8
        
        mDeleteButton.layer.borderColor = UIColor.red.cgColor
        mDeleteButton.layer.borderWidth = 2
        mDeleteButton.layer.cornerRadius = 8
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as!
            Page2CollectionViewCell
        
        //        let text = cell.mLabel.text
        //        cell.mLabel.text = "\(data[0])"
//        cell.mImageView.image = UIImage(named: data[0])
//       cell.mImageViewPage2.image = UIImage(named: data[0])
         cell.mImageViewPage2.image = UIImage(named: data[0])
        
        return cell
    }
    
    @IBAction func confirmDeleteEvent() {
        let alert = UIAlertController(title: "Confirm Delete", message: "Do you want to delete this event?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    func feedData(){
                let url = "http://localhost:8000/api/appointments/1"
   
        print("Feed")
        AF.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(ResponseDetail.self, from: response.data!)
                        var eventDetail = result.data
                        
                        var startDate = self.epochToDate(eventDetail.apStartTime)
                        var endDate = self.epochToDate(eventDetail.apEndTime)
                        
                        var strtime=startDate.description.components(separatedBy: " ")[1].components(separatedBy: ":")
                        
                        var dateEvent = startDate.description.components(separatedBy: " ")[0].components(separatedBy: ":")
                        
                       
                        self.mDayMMYY.text = "\(dateEvent)"
                        
                        self.mTime.text = "From "+strtime[0]+":"+strtime[1]
                        
                        self.mLabelDescription.text = eventDetail.apDescription
                        
                        self.mLocation.text = eventDetail.apLocation
                        
                        print("end time ---->", endDate)


                        print(eventDetail.apDescription)
                    } catch {
                        print("catch")
                    }
                    
                    break
                case let .failure(error):
                    print(error)
                    break
                }
                
        }
        print("End Feed")
    }
    
    
    func epochToDate(_ epoch:Int) -> NSDate {
        let date = NSDate(timeIntervalSince1970: (60*60*7)+Double(epoch) ) as Date
        return date as NSDate
    }
    
    
}
