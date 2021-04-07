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
        var cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "questionExplanation", for: indexPath)
            cell.textLabel?.text = bookmarkedQuestion.question
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath)
        }
    
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
//
//        return view
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return detailQuestionTableView.sectionFooterHeight
    }
}
