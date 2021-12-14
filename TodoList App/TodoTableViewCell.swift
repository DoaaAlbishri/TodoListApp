//
//  TodoTableViewCell.swift
//  TodoList App
//
//  Created by admin on 13/12/2021.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoDueDate: UILabel!
    @IBOutlet weak var todoNote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
