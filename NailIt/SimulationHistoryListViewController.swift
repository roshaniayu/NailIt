//
//  SimulationHistoryListViewController.swift
//  NailIt
//
//  Created by Muhsan Maulana on 08/04/21.
//

import UIKit

class SimulationHistoryListViewController: UIViewController {
    
    var judulSimulasi = ["Simulasi Pertama", "Simulasi Kedua", "Simulasi Ketiga"]
    var tglSimulasi = ["7 April 2021", "8 April 2021", "10 April 2021"]

    @IBOutlet weak var simulationListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension SimulationHistoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return judulSimulasi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.judulSimulasi.text = judulSimulasi[indexPath.row]
        cell?.tanggalSimulasi.text = tglSimulasi[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SimulationDetailViewController") as! SimulationDetailViewController
        vc.video = UIImage (named: judulSimulasi[indexPath.row])!
        vc.judul = judulSimulasi[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
