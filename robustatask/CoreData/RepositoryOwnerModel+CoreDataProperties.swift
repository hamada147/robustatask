//
//  RepositoryOwnerModel+CoreDataProperties.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//
//

import Foundation
import CoreData


extension RepositoryOwnerModel {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<RepositoryOwnerModel> {
        return NSFetchRequest<RepositoryOwnerModel>(entityName: "RepositoryOwnerModel")
    }

    @NSManaged public var avatarURL: String
    @NSManaged public var gravatarId: String
    @NSManaged public var idAPI: Int32
    @NSManaged public var login: String
    @NSManaged public var url: String
    @NSManaged public var repoRelationship: RepositoryModel?

}

extension RepositoryOwnerModel : Identifiable {
    public var id: Int32 {
        return self.idAPI
    }
}
