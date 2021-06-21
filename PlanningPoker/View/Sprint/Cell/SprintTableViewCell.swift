//
//  SprintTableViewCell.swift
//  PlanningPoker
//
//  Created by Rubens Ferreira Ramos on 21/06/21.
//

import UIKit

class SprintTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelLink: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(sprint: Sprint) {
        labelNome.text = sprint.nome
        labelLink.text = sprint.link
    }
}
