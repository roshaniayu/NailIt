//
//  SimulationDetailViewController.swift
//  NailIt
//
//  Created by Muhsan Maulana on 08/04/21.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
