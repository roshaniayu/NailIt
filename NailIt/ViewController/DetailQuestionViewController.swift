//
//  DetailQuestionViewController.swift
//  NailIt
//
//  Created by Gede Wicaksana on 01/04/21.
//

import UIKit

class DetailQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var headTitle: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var example: UITextView!
    
    var quest: QuestionTech?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headTitle.text = quest?.title
        desc.text = quest?.description
        example.text = quest?.details
        
        // Do any additional setup after loading the view.
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
