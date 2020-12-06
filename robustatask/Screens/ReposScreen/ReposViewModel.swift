//
//  ReposViewModel.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//

import Foundation

protocol ReposViewModelDelegate {
    func didGetRepositories(_ repos: [RepositoryModel])
    func errorInRetrivingData(error: ErrorResponse)
}

class ReposViewModel {
    lazy var reposity: RepositoriesRepository = RepositoriesRepository(delegate: self)
    var delegate: ReposViewModelDelegate? = nil
    var since: Int = 0
    
    func getRepositories() {
        self.reposity.getRepositories(since: self.since)
    }
    
    func searchRepo(search: String) {
        self.since = 0
        self.reposity.searchRepo(search: search)
    }
}

extension ReposViewModel: RepositoryDelegate {
    func onSuccess(response: Any) {
        if (response is [RepositoryModel]) {
            let repos = response as! [RepositoryModel]
            self.since = Int(repos[repos.count - 1].id)
            self.delegate?.didGetRepositories(repos)
        } else {
            LoggingManager.logError("Missed handling in ReposViewModel-onSuccess")
        }
    }
    
    func onFailed(error: ErrorResponse) {
        self.delegate?.errorInRetrivingData(error: error)
    }
    
    func onSearchFinish(result: Any?) {
        if (result != nil) {
            let actulResult = result as! RepositoryModel
            self.delegate?.didGetRepositories([actulResult])
        }
    }
}
