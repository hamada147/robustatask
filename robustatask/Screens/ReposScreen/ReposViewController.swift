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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    var refreshControl = UIRefreshControl()
    
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
        self.vm.getRepositories()
        self.loadingIndicator.isHidden = false
    }
    
    private func initUI() {
        self.hideKeyboardWhenTappedAround()
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        self.reposTableView.refreshControl = self.refreshControl
        
        self.reposTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        self.reposTableView.delegate = self
        self.reposTableView.dataSource = self
        self.reposTableView.tableFooterView = UIView()
        
        self.searchBar.delegate = self
    }
    
    @objc
    func refresh(sender: Any) {
        self.vm.since = 0
        self.refreshControl.beginRefreshing()
        self.vm.getRepositories()
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
        cell.vm = RepoTableViewModel(repo: self.repos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // TODO: navigate to repos detail screen
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.dismissKeyboard()
    }
}

extension ReposViewController: ReposViewModelDelegate {
    func didGetRepositories(_ repos: [RepositoryModel]) {
        self.repos = repos
        self.refreshControl.endRefreshing()
        self.loadingIndicator.isHidden = true
    }
    
    func errorInRetrivingData(error: ErrorResponse) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {_ in
                self.loadingIndicator.isHidden = true
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ReposViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count >= 2) {
            self.loadingIndicator.isHidden = false
            self.vm.searchRepo(search: searchText)
        } else {
            self.loadingIndicator.isHidden = false
            self.vm.getRepositories()
        }
    }
}
 
