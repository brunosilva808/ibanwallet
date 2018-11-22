//
//  Gist.swift
//  iBanwallet
//
//  Created by Bruno Silva on 21/11/2018.
//

import Foundation
import ObjectMapper
import RealmSwift

class GistDec: Decodable {
    let forksUrl: String
    let gitPullUrl: String
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case forksUrl = "forks_url"
        case gitPullUrl = "git_pull_url"
        case htmlUrl = "html_url"
    }
}

class Gist1: Object, Mappable {
    
    // MARK: Properties
    @objc dynamic var forksUrl: String?
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var autor = ""
    @objc dynamic var genre = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        forksUrl    <- map["forks"]
        id          <- map["id"]
        title       <- map["title"]
        autor       <- map["autor"]
        genre       <- map["genre"]
    }
}

class Gist: Object, Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let forksUrl = "forks_url"
        static let gitPullUrl = "git_pull_url"
        static let htmlUrl = "html_url"
        static let updatedAt = "updated_at"
        static let gitPushUrl = "git_push_url"
        static let descriptionValue = "description"
        static let commitsUrl = "commits_url"
        static let files = "files"
        static let id = "id"
        static let createdAt = "created_at"
        static let comments = "comments"
        static let owner = "owner"
        static let truncated = "truncated"
        static let commentsUrl = "comments_url"
        static let nodeId = "node_id"
        static let url = "url"
        static let publicAttribute = "public"
    }
    
    // MARK: Properties
    @objc dynamic  var forksUrl: String?
    @objc dynamic  var gitPullUrl: String?
    @objc dynamic  var htmlUrl: String?
    @objc dynamic  var updatedAt: String?
    @objc dynamic  var gitPushUrl: String?
    @objc dynamic  var descriptionValue: String?
    @objc dynamic  var commitsUrl: String?
    @objc dynamic  var id: String?
    @objc dynamic  var createdAt: String?
    @objc dynamic  var comments: Int = 0
    @objc dynamic  var truncated: Bool = false
    @objc dynamic  var commentsUrl: String?
    @objc dynamic  var nodeId: String?
    @objc dynamic  var url: String?
    @objc dynamic  var publicAttribute: Bool = false
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    required convenience init?(map: Map) {
        self.init()
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    func mapping(map: Map) {
        forksUrl <- map[SerializationKeys.forksUrl]
        gitPullUrl <- map[SerializationKeys.gitPullUrl]
        htmlUrl <- map[SerializationKeys.htmlUrl]
        updatedAt <- map[SerializationKeys.updatedAt]
        gitPushUrl <- map[SerializationKeys.gitPushUrl]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        commitsUrl <- map[SerializationKeys.commitsUrl]
        id <- map[SerializationKeys.id]
        createdAt <- map[SerializationKeys.createdAt]
        comments <- map[SerializationKeys.comments]
        truncated <- map[SerializationKeys.truncated]
        commentsUrl <- map[SerializationKeys.commentsUrl]
        nodeId <- map[SerializationKeys.nodeId]
        url <- map[SerializationKeys.url]
        publicAttribute <- map[SerializationKeys.publicAttribute]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = forksUrl { dictionary[SerializationKeys.forksUrl] = value }
        if let value = gitPullUrl { dictionary[SerializationKeys.gitPullUrl] = value }
        if let value = htmlUrl { dictionary[SerializationKeys.htmlUrl] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = gitPushUrl { dictionary[SerializationKeys.gitPushUrl] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = commitsUrl { dictionary[SerializationKeys.commitsUrl] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        dictionary[SerializationKeys.comments] = comments
        dictionary[SerializationKeys.truncated] = truncated
        if let value = commentsUrl { dictionary[SerializationKeys.commentsUrl] = value }
        if let value = nodeId { dictionary[SerializationKeys.nodeId] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        dictionary[SerializationKeys.publicAttribute] = publicAttribute
        return dictionary
    }
    
}
