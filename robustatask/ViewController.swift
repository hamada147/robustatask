//
//  ViewController.swift
//  robustatask
//
//  Created by Moussa on 03/12/2020.
//

import UIKit

class ViewController: UIViewController {

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

extension ViewController: ConnectorDelegate {
    func callCompleted(_ response: Any!) {
        if (response is RepositoriesResponse) {
            let actualResponse = response as! RepositoriesResponse
            let repos = actualResponse.repositories as? [Repository]
            
            print(repos?.count ?? 0)
            
        } else {
            // TODO: Show error here
        }
    }
    
    func callFailed(_ response: ErrorResponse!) {
        // TODO: Show error here
    }
}
