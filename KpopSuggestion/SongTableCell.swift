//
//  SongTableCell.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/14/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit

class SongTableCell: UITableViewCell {

    
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
