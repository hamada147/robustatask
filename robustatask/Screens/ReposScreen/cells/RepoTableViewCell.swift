//
//  RepoTableViewCell.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//

import UIKit

class RepoTableViewModel: RepositoryDelegate {
    lazy var repository = RepositoriesRepository(delegate: self)
    let repo: RepositoryModel
    
    init(repo: RepositoryModel) {
        self.repo = repo
    }
    
    func getRepoDetails() {
        self.repository.getRepoDetails(id: Int(self.repo.id))
    }
    
    func onSuccess(response: Any) {
        
    }
    
    func onFailed(error: ErrorResponse) {
        
    }
    
    func onSearchFinish(result: Any?) {}
}

class RepoTableViewCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var reoAuthorName: UILabel!
    @IBOutlet weak var repoAuthorImg: UIImageView!
    @IBOutlet weak var creationDateLbl: UILabel!
    
    var vm: RepoTableViewModel! {
        didSet {
            self.repoNameLbl.text = self.vm.repo.fullName
            self.reoAuthorName.text = self.vm.repo.ownerRelationship?.login
            self.repoAuthorImg.downloaded(from: self.vm.repo.ownerRelationship?.avatarURL ?? "")
            self.vm.getRepoDetails()
        }
    }
    
    var creationDate: String = "" {
        didSet {
            // Creation Date don't exisit in the provided endpoint.
            // I need to get it by calling same endpoint and providing it with the repo id.
            let date = "Not Provided"
            self.creationDateLbl.text = "Creation Date: \(date)"
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
