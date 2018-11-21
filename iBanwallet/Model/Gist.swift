//
//  Gist.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on November 21, 2018

import Foundation
import ObjectMapper

struct Swifter: Decodable {
    let url: String
    let forks_url: String
}


class Gist : Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
    
    }
    
    
    var comments : Int!
    var commentsUrl : String!
    var commitsUrl : String!
    var createdAt : String!
    var descriptionField : String!
    var forksUrl : String!
    var gitPullUrl : String!
    var gitPushUrl : String!
    var htmlUrl : String!
    var id : String!
    var nodeId : String!
    var publicField : Bool!
    var truncated : Bool!
    var updatedAt : String!
    var url : String!
    var user : AnyObject!
    
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        comments = dictionary["comments"] as? Int
        commentsUrl = dictionary["comments_url"] as? String
        commitsUrl = dictionary["commits_url"] as? String
        createdAt = dictionary["created_at"] as? String
        descriptionField = dictionary["description"] as? String
        forksUrl = dictionary["forks_url"] as? String
        gitPullUrl = dictionary["git_pull_url"] as? String
        gitPushUrl = dictionary["git_push_url"] as? String
        htmlUrl = dictionary["html_url"] as? String
        id = dictionary["id"] as? String
        nodeId = dictionary["node_id"] as? String
        publicField = dictionary["public"] as? Bool
        truncated = dictionary["truncated"] as? Bool
        updatedAt = dictionary["updated_at"] as? String
        url = dictionary["url"] as? String
        user = dictionary["user"] as? AnyObject
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if comments != nil{
            dictionary["comments"] = comments
        }
        if commentsUrl != nil{
            dictionary["comments_url"] = commentsUrl
        }
        if commitsUrl != nil{
            dictionary["commits_url"] = commitsUrl
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if forksUrl != nil{
            dictionary["forks_url"] = forksUrl
        }
        if gitPullUrl != nil{
            dictionary["git_pull_url"] = gitPullUrl
        }
        if gitPushUrl != nil{
            dictionary["git_push_url"] = gitPushUrl
        }
        if htmlUrl != nil{
            dictionary["html_url"] = htmlUrl
        }
        if id != nil{
            dictionary["id"] = id
        }
        if nodeId != nil{
            dictionary["node_id"] = nodeId
        }
        if publicField != nil{
            dictionary["public"] = publicField
        }
        if truncated != nil{
            dictionary["truncated"] = truncated
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if url != nil{
            dictionary["url"] = url
        }
        if user != nil{
            dictionary["user"] = user
        }
        return dictionary
    }
    
}
