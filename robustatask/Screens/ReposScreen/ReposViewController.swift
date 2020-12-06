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
    
    var vm: ReposViewModel = ReposViewModel()
    
    var repos: [RepositoryModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reposTableView?.reloadData()
            }
        }
    }
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.vm.delegate = self
        self.initUI()
        self.vm.getRepositories(since: 0)
    }
    
    private func initUI() {
        self.reposTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        self.reposTableView.delegate = self
        self.reposTableView.dataSource = self
        self.reposTableView.tableFooterView = UIView()
    }
}

extension ReposViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as! RepoTableViewCell
        cell.textLabel?.text = self.repos[indexPath.row].fullName
        return cell
    }
}

extension ReposViewController: ReposViewModelDelegate {
    func didGetRepositories(_ repos: [RepositoryModel]) {
        self.repos = repos
    }
    
    func errorInRetrivingData(error: ErrorResponse) {
        DispatchQueue.main.async {
            // TODO: Show Error UI Here
        }
    }
}
