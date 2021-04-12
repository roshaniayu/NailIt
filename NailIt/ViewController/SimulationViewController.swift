//
//  SimulationViewController.swift
//  NailIt
//
//  Created by Roshani Ayu Pranasti on 09/04/21.
//

import UIKit
import AVKit
import MobileCoreServices

class SimulationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var simulationTableView: UITableView!
    
    var videoAndImageReview = UIImagePickerController()
    var videoURL : URL?
    
    var bookmarks: [BookmarkModel] = [BookmarkModel(id_question: 1, id_bookmark: 1, question: "What makes you unique?"), BookmarkModel(id_question: 2, id_bookmark: 2, question: "If you could change one thing about your personality, what would it be?", notes: "test"), BookmarkModel(id_question: 3, id_bookmark: 3, question: "What hobbies or sports are you involved with outside of work, and why do you enjoy them?")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        simulationTableView.delegate = self
        simulationTableView.dataSource = self
    }
}

extension SimulationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let aboutSimulationCell = tableView.dequeueReusableCell(withIdentifier: "aboutSimulation", for: indexPath) as! AboutSimulationTableViewCell
            aboutSimulationCell.startSimulationButton.layer.cornerRadius = 8
            
            return aboutSimulationCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listOfQuestions", for: indexPath)
        cell.textLabel?.text = bookmarks[indexPath.row].question
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
            let listLabel = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 44))
            listLabel.text = "LIST OF QUESTIONS"
            listLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
            listLabel.textColor = UIColor.gray
            view.addSubview(listLabel)
            
            return view
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return simulationTableView.sectionFooterHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 354
        }
        
        return UITableView.automaticDimension
    }
    
    
    @IBAction func recordAct(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            print("Camera Available")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera UnAvailable")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? String,
            mediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL,
            UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else {
                return
        }
        // Handle a movie capture
        UISaveVideoAtPathToSavedPhotosAlbum(
            url.path,
            self,
            #selector(video(_:didFinishSavingWithError:contextInfo:)),
            nil)
    }
    
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // playing Video
    
    @IBAction func playAct(_ sender: UIButton) {
        videoAndImageReview.sourceType = .savedPhotosAlbum
        videoAndImageReview.delegate = self
        videoAndImageReview.mediaTypes = ["public.movie"]
        present(videoAndImageReview, animated: true, completion: nil)
    }
    
    func videoAndImageReview(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        videoURL = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL
        print("\(String(describing: videoURL))")
        self.dismiss(animated: true, completion: nil)
    }
}
