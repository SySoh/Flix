//
//  MovieCell.swift
//  Flix
//
//  Created by Shao Yie Soh on 6/21/17.
//  Copyright © 2017 Shao Yie Soh. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var overviewLabel: UITextView!
    @IBOutlet weak var titleLabel: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
