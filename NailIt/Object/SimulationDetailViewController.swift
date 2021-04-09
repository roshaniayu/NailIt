//
//  SimulationDetailViewController.swift
//  NailIt
//
//  Created by Muhsan Maulana on 09/04/21.
//

import UIKit

class SimulationDetailViewController: UIViewController {
    
    var video = UIImage()
    var judul = ""
    

    @IBOutlet weak var labelJudul: UILabel!
    
    @IBOutlet weak var imagePrev: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelJudul.text = "\(judul)"
        imagePrev.image = video
    }
    

  

}
