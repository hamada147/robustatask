//
//  ReposViewController.swift
//  robustatask
//
//  Created by Moussa on 03/12/2020.
//

import UIKit

class ReposViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var reposTableView: UITableView!
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let connector = RepositoriesConnector(delegate: self)
        connector?.getRepositories(0)
    }


}

extension ReposViewController: ConnectorDelegate {
    func callCompleted(_ response: Any!) {
        if (response is RepositoriesResponse) {
            let actualResponse = response as! RepositoriesResponse
            let repos = actualResponse.repositories as? [Repository]
        } else {
            // TODO: Show error here
        }
    }
    
    func callFailed(_ response: ErrorResponse!) {
        // TODO: Show error here
    }
}
