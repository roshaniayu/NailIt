//
//  CellTableViewCell.swift
//  NailIt
//
//  Created by Muhsan Maulana on 09/04/21.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var judulSimulasi: UILabel!
    @IBOutlet weak var tanggalSimulasi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
