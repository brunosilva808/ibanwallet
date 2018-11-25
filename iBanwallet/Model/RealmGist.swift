//
//  RealmGist.swift
//
//  Created by Bruno Silva on 24/11/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class RealmGist: Object, Mappable {
    
    private struct SerializationKeys {
        static let descriptionValue = "description"
        static let id = "id"
        static let owner = "owner"
    }
    
    @objc dynamic public var descriptionValue: String?
    @objc dynamic public var id: String? = ""
    @objc dynamic public var owner: RealmOwner?

    required public convenience init?(map: Map){
        self.init()
    }
    
    override public class func primaryKey() -> String? {
        return SerializationKeys.id
    }
    
    public func mapping(map: Map) {
        descriptionValue <- map[SerializationKeys.descriptionValue]
        id <- map[SerializationKeys.id]
        owner <- map[SerializationKeys.owner]
    }

    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = owner { dictionary[SerializationKeys.owner] = value.dictionaryRepresentation() }
        return dictionary
    }
    
}
