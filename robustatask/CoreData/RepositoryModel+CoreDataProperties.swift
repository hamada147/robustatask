//
//  RepositoryModel+CoreDataProperties.swift
//  robustatask
//
//  Created by Moussa on 06/12/2020.
//
//

import Foundation
import CoreData


extension RepositoryModel {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<RepositoryModel> {
        return NSFetchRequest<RepositoryModel>(entityName: "RepositoryModel")
    }

    @NSManaged public var fullName: String
    @NSManaged public var idAPI: Int32
    @NSManaged public var name: String
    @NSManaged public var repositoryDescription: String
    @NSManaged public var url: String
    @NSManaged public var ownerRelationship: RepositoryOwnerModel?

}

extension RepositoryModel : Identifiable {
    public var id: Int32 {
        return self.idAPI
    }
}
