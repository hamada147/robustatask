//
//  RepositoriesRepository.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//

import Foundation
import CoreData
import UIKit

protocol RepositoriesRepositoryInterface {
    func getRepositories(since: Int)
    func searchRepo(search: String)
}

protocol RepositoryDelegate {
    func onSuccess(response: Any)
    func onFailed(error: ErrorResponse)
    func onSearchFinish(result: Any?)
}

class RepositoriesRepository: NSObject, RepositoriesRepositoryInterface, ConnectorDelegate {
    
    var delegate: RepositoryDelegate? = nil
    
    init(delegate: RepositoryDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func getRepositories(since: Int) {
        if (Reachability.isConnectedToNetwork()) {
            let connector = RepositoriesConnector(delegate: self)
            connector?.getRepositories(Int32(since))
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let request = RepositoryModel.createFetchRequest()
            
            do {
                let repos = try managedContext.fetch(request)
                self.delegate?.onSuccess(response: repos)
            } catch let error as NSError {
                LoggingManager.logError(error.localizedDescription)
                let error = ErrorResponse(error.localizedDescription)
                self.delegate?.onFailed(error: error!)
            }
        }
    }
    
    func searchRepo(search: String) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let request = RepositoryModel.createFetchRequest()
            request.predicate = NSPredicate(format: "fullName CONTAINS[c] '\(search)'")
            
            do {
                let repo = try managedContext.fetch(request)
                if (repo.count >= 1) {
                    self.delegate?.onSearchFinish(result: repo[0])
                } else {
                    self.delegate?.onSearchFinish(result: nil)
                }
            } catch let error as NSError {
                LoggingManager.logError(error.localizedDescription)
                self.delegate?.onSearchFinish(result: nil)
            }
        }
    }
    
    private func save(repos: [Repository]) -> [RepositoryModel] {
        var repos2: [RepositoryModel] = []
        for repo in repos {
            repos2.append(self.save(repo: repo))
        }
        return repos2
    }
    
    private func save(repo: Repository) -> RepositoryModel {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext

        let owner = RepositoryOwnerModel(context: managedContext)
        owner.idAPI = repo.owner.id
        owner.avatarURL = repo.owner.avatarURL
        owner.gravatarId = repo.owner.gravatarId
        owner.login = repo.owner.login
        owner.url = repo.owner.url
        
        let repo2 = RepositoryModel(context: managedContext)
        repo2.idAPI = repo.id
        repo2.name = repo.name
        repo2.fullName = repo.fullName
        repo2.url = repo.url
        repo2.ownerRelationship = owner
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            LoggingManager.logError(error.localizedDescription)
        }
        
        return repo2
    }
    
    // MARK:- ConnectorDelegate
    func callCompleted(_ response: Any!) {
        if (response is RepositoriesResponse) {
            let actualResponse = response as! RepositoriesResponse
            if let repos = actualResponse.repositories as? [Repository] {
                DispatchQueue.main.async {
                    let result = self.save(repos: repos)
                    self.delegate?.onSuccess(response: result)
                }
            }
        }
    }
    
    func callFailed(_ response: ErrorResponse!) {
        self.delegate?.onFailed(error: response)
    }
}
