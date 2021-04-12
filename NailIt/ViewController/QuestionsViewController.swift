//
//  QuestionsViewController.swift
//  NailIt
//
//  Created by Gede Wicaksana on 01/04/21.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var value = 0
    var indexNum = 0
    var titleHead = "title"
    
    
    @IBAction func backButtonPushed(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          navItem.title = titleHead
            
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var jumlah = 0
        if value == 0 {
            switch indexNum {
            case 0:
                jumlah = 0
            case 1:
                jumlah = 1
            case 2:
                jumlah = 2
            default:
                break
            }
        }else {
            switch indexNum {
            case 0:
                jumlah = 3
            case 1:
                jumlah = 4
            case 2:
                jumlah = 5
            case 3:
                jumlah = 6
            case 4:
                jumlah = 7
            default:
                break
            }
        }
        let data = DataLoader(id: jumlah).questionAll
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        if value == 0 {
            switch indexNum {
            case 0:
                let data = DataLoader(id: 0).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 1:
                let data = DataLoader(id: 1).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 2:
                let data = DataLoader(id: 2).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            default:
                break
              
            }
        }else {
            switch indexNum {
            case 0:
                let data = DataLoader(id: 3).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 1:
                let data = DataLoader(id: 4).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 2:
                let data = DataLoader(id: 5).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 3:
                let data = DataLoader(id: 6).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            case 4:
                let data = DataLoader(id: 7).questionAll
                cell.textLabel?.text = data[indexPath.row].title
            default:
                break
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if value == 0 {
                   switch indexNum {
                   case 0:
                       let data = DataLoader(id: 0).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   case 1:
                       let data = DataLoader(id: 1).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   case 2:
                       let data = DataLoader(id: 2).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   default:
                       break
       
                   }
               }else {
                   switch indexNum {
                   case 0:
                       let data = DataLoader(id: 3).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   case 1:
                       let data = DataLoader(id: 4).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                       
                   case 2:
                       let data = DataLoader(id: 5).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   case 3:
                       let data = DataLoader(id: 6).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                      
                   case 4:
                       let data = DataLoader(id: 7).questionAll
                    if let destination = segue.destination as? DetailQuestionViewController {
                        destination.quest = data[tableView.indexPathForSelectedRow!.row]
                    }
                   default:
                       break
                   }
               }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.navigationBar.prefersLargeTitles = true

           let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            navigationController?.navigationBar.tintColor = .blue
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
   }
}
