//
//  ViewController.swift
//  NailIt
//
//  Created by Gede Wicaksana on 31/03/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var TechnicalCollectionView: UICollectionView!
    @IBOutlet weak var GeneralCollectionView: UICollectionView!
    //@IBOutlet weak var navItem1: UINavigationItem!
    
    var TechnicalImage: [UIImage] = [
        UIImage(#imageLiteral(resourceName: "swift")),
        UIImage(#imageLiteral(resourceName: "pythonn")),
        UIImage(#imageLiteral(resourceName: "javaa"))
    ]
    var TechnicalName = ["Swift","Python","Java"]
    var GeneralImage: [UIImage] = [
        UIImage(#imageLiteral(resourceName: "img4")),
        UIImage(#imageLiteral(resourceName: "img2")),
        UIImage(#imageLiteral(resourceName: "img1")),
        UIImage(#imageLiteral(resourceName: "img5")),
        UIImage(#imageLiteral(resourceName: "img3"))
    ]
    var GeneralName = ["Character","Company","Experience","Skill","Teamwork"]
    

        override func viewDidLoad() {
            super.viewDidLoad()
            GeneralCollectionView.isHidden = true
           
        }
    
    
    @IBAction func SegmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            TechnicalCollectionView.isHidden = false
            GeneralCollectionView.isHidden = true
        }
        else{
            TechnicalCollectionView.isHidden = true
            GeneralCollectionView.isHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == TechnicalCollectionView  {
            return TechnicalImage.count
        }
        return GeneralImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == TechnicalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TechnicalCollectionViewCell", for: indexPath) as! TechnicalCollectionViewCell
            cell.TechnicalLogo.image = TechnicalImage[indexPath.item]
            cell.judulTLbl.text = TechnicalName[indexPath.item]
            
            cell.contentView.layer.cornerRadius = 40.0
            
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as! GeneralCollectionViewCell
        cell.GeneralLogo.image = GeneralImage[indexPath.item]
        cell.judulLbl.text = GeneralName[indexPath.item]
        cell.contentView.layer.cornerRadius = 40.0
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = storyboard?.instantiateViewController(identifier: "QuestionsViewController") as? QuestionsViewController
        
        if collectionView == TechnicalCollectionView{
            cell?.value = 0
            cell?.titleHead = TechnicalName[indexPath.item]
            
        }
        else{
            cell?.value = 1
            cell?.titleHead = GeneralName[indexPath.item]
                    }
        cell?.indexNum = indexPath.item
        self.navigationController?.pushViewController(cell!, animated: true)
        
    }
    
}

