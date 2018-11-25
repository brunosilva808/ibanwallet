//
//  Owner.swift
//
//  Created by Bruno Silva on 24/11/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class RealmOwner: Object, Mappable {
    
    private struct SerializationKeys {
        static let type = "type"
        static let login = "login"
        static let id = "id"
        static let avatarUrl = "avatar_url"
    }
    
    @objc dynamic public var type: String?
    @objc dynamic public var login: String?
    @objc dynamic public var avatarUrl: String?
    @objc dynamic public var id = 0

    required public convenience init?(map: Map){
        self.init()
    }
    
    override public class func primaryKey() -> String? {
        return SerializationKeys.id
    }
    
    public func mapping(map: Map) {
        type <- map[SerializationKeys.type]
        login <- map[SerializationKeys.login]
        id <- map[SerializationKeys.id]
        avatarUrl <- map[SerializationKeys.avatarUrl]
    }

    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = type { dictionary[SerializationKeys.type] = value }
        if let value = login { dictionary[SerializationKeys.login] = value }
        if let value = avatarUrl { dictionary[SerializationKeys.avatarUrl] = value }
        dictionary[SerializationKeys.id] = id 
        return dictionary
    }
    
}
