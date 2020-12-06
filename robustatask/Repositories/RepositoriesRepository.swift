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
    func getRepoDetails(id: Int)
    func searchRepo(search: String)
}

protocol RepositoryDelegate: class {
    func onSuccess(response: Any)
    func onFailed(error: ErrorResponse)
    func onSearchFinish(result: Any?)
}

class RepositoriesRepository: NSObject, RepositoriesRepositoryInterface, ConnectorDelegate {
    
    weak var delegate: RepositoryDelegate? = nil
    lazy var connector = RepositoriesConnector(delegate: self)
    
    init(delegate: RepositoryDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func getRepositories(since: Int) {
        if (Reachability.isConnectedToNetwork()) {
            self.connector?.getRepositories(Int32(since))
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
    
    func getRepoDetails(id: Int) {
        if (Reachability.isConnectedToNetwork()) {
            self.connector?.getRepoDetails(Int32(id))
        } else {
            LoggingManager.logError("No internet connection")
            let error = ErrorResponse("No internet connection")
            self.delegate?.onFailed(error: error!)
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
        if (repo.owner.avatarURL != nil) {
            owner.avatarURL = repo.owner.avatarURL
        } else {
            owner.avatarURL = ""
        }
        if (repo.owner.gravatarId != nil) {
            owner.gravatarId = repo.owner.gravatarId
        } else {
            owner.gravatarId = ""
        }
        if (repo.owner.login != nil) {
            owner.login = repo.owner.login
        } else {
            owner.login = ""
        }
        if (repo.owner.url != nil) {
            owner.url = repo.owner.url
        } else {
            owner.url = ""
        }
        
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
    
    private func update(repo: Repository) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = RepositoryModel.createFetchRequest()
        request.predicate = NSPredicate(format: "idAPI == \(repo.id)")
        
        do {
            let repo2 = try managedContext.fetch(request)
            if (repo2.count >= 1) {
                repo2[0].createdDate = repo.created_at
            } else {
                let _ = self.save(repo: repo)
            }
        } catch let error as NSError {
            LoggingManager.logError(error.localizedDescription)
        }
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
