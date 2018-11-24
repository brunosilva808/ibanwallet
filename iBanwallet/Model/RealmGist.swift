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
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let forksUrl = "forks_url"
        static let gitPullUrl = "git_pull_url"
        static let htmlUrl = "html_url"
        static let updatedAt = "updated_at"
        static let gitPushUrl = "git_push_url"
        static let descriptionValue = "description"
        static let commitsUrl = "commits_url"
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
    public var forksUrl: String?
    public var gitPullUrl: String?
    public var htmlUrl: String?
    public var updatedAt: String?
    public var gitPushUrl: String?
    public var descriptionValue: String?
    public var commitsUrl: String?
    public var id: String?
    public var createdAt: String?
    public var comments: Int?
    public var owner: RealmOwner?
    public var truncated: Bool? = false
    public var commentsUrl: String?
    public var nodeId: String?
    public var url: String?
    public var publicAttribute: Bool? = false
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    required public convenience init?(map: Map){
        self.init()
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
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
        owner <- map[SerializationKeys.owner]
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
        if let value = comments { dictionary[SerializationKeys.comments] = value }
        if let value = owner { dictionary[SerializationKeys.owner] = value.dictionaryRepresentation() }
        dictionary[SerializationKeys.truncated] = truncated
        if let value = commentsUrl { dictionary[SerializationKeys.commentsUrl] = value }
        if let value = nodeId { dictionary[SerializationKeys.nodeId] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        dictionary[SerializationKeys.publicAttribute] = publicAttribute
        return dictionary
    }
    
}
