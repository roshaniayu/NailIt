//
//  DetailBookmarkViewController.swift
//  NailIt
//
//  Created by Roshani Ayu Pranasti on 07/04/21.
//

import UIKit

class DetailBookmarkViewController: UIViewController {

    @IBOutlet weak var detailQuestionTableView: UITableView!
    
    var bookmarkedQuestion: BookmarkModel = BookmarkModel()
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailQuestionTableView.delegate = self
        detailQuestionTableView.dataSource = self
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

extension DetailBookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let notesCell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! NotesTableViewCell
            notesCell.notesTextView.delegate = self
            
            if bookmarkedQuestion.notes.isEmpty {
                notesCell.notesTextView.text = "Notes"
                notesCell.notesTextView.textColor = UIColor.lightGray
            } else {
                notesCell.notesTextView.text = bookmarkedQuestion.notes
            }
            
            return notesCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionExplanation", for: indexPath)
            cell.textLabel?.text = bookmarkedQuestion.question
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return detailQuestionTableView.sectionFooterHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 215
        }
        
        return UITableView.automaticDimension
    }
}

extension DetailBookmarkViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Notes"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("Value berubah")
        
        // TODO: ubah value di data
    }
}
