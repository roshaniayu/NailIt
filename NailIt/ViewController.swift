//
//  ViewController.swift
//  NailIt
//
//  Created by Roshani Ayu Pranasti on 05/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookmarkTableView: UITableView!
    
    var bookmarks: [BookmarkModel] = [BookmarkModel(id_question: 1, id_bookmark: 1, question: "What makes you unique"), BookmarkModel(id_question: 2, id_bookmark: 2, question: "If you could change one thing about your personality, what would it be?", notes: "test"), BookmarkModel(id_question: 3, id_bookmark: 3, question: "What hobbies or sports are you involved with outside of work, and why do you enjoy them?")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bookmarkTableView.delegate = self
        bookmarkTableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell", for: indexPath)
        let bookmark = bookmarks[indexPath.row]
        cell.textLabel?.text = bookmark.question
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, onComplete) in
            self.bookmarks.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
