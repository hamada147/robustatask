//
//  RepoTableViewCell.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var reoAuthorName: UILabel!
    @IBOutlet weak var repoAuthorImg: UIImageView!
    var imageURL: String = "" {
        didSet {
            self.repoAuthorImg.downloaded(from: self.imageURL)
        }
    }
    
    // MARK:- Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
