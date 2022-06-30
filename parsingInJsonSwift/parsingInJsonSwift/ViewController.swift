//
//  ViewController.swift
//  parsingInJsonSwift
//
//  Created by Raghav Mahesh Deo on 22/12/20.
//

import UIKit

class ViewController: UIViewController {
//https://api.github.com/repositories/19438/commits
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        parseJson(url: "https://api.github.com/repositories/19438/commits")
        
        
        // Do any additional setup after loading the view.
    }

    func parseJson(url:String)
    {
        guard let url = URL(string: url)  else {
            return
        }
        _ = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard response != nil else { return}
            guard let data = data else { return}
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                for dic in jsonResponse
                {
                    let commitDic =  dic["commit"] as! [String:Any]
                    let authorDic = commitDic["author"] as! [String:Any]
                    let name = authorDic["name"] as! String
                    print(name)
                    
                }
                
           // print(jsonResponse)
            }
            catch
            {
                
            }
            
            
            
        }.resume()
        
        
        
        
        
    }

}

/*
 
 import Foundation

 // MARK: - Commit
 struct Commit: Codable {
     let sha, nodeID: String
     let commit: CommitClass
     let url, htmlURL, commentsURL: String
     let author, committer: CommitAuthor
     let parents: [Parent]

     enum CodingKeys: String, CodingKey {
         case sha
         case nodeID = "node_id"
         case commit, url
         case htmlURL = "html_url"
         case commentsURL = "comments_url"
         case author, committer, parents
     }
 }

 // MARK: - CommitAuthor
 struct CommitAuthor: Codable {
     let login: String
     let id: Int
     let nodeID: String
     let avatarURL: String
     let gravatarID: String
     let url, htmlURL, followersURL: String
     let followingURL, gistsURL, starredURL: String
     let subscriptionsURL, organizationsURL, reposURL: String
     let eventsURL: String
     let receivedEventsURL: String
     let type: TypeEnum
     let siteAdmin: Bool

     enum CodingKeys: String, CodingKey {
         case login, id
         case nodeID = "node_id"
         case avatarURL = "avatar_url"
         case gravatarID = "gravatar_id"
         case url
         case htmlURL = "html_url"
         case followersURL = "followers_url"
         case followingURL = "following_url"
         case gistsURL = "gists_url"
         case starredURL = "starred_url"
         case subscriptionsURL = "subscriptions_url"
         case organizationsURL = "organizations_url"
         case reposURL = "repos_url"
         case eventsURL = "events_url"
         case receivedEventsURL = "received_events_url"
         case type
         case siteAdmin = "site_admin"
     }
 }

 enum TypeEnum: String, Codable {
     case user = "User"
 }

 // MARK: - CommitClass
 struct CommitClass: Codable {
     let author, committer: CommitAuthorClass
     let message: String
     let tree: Tree
     let url: String
     let commentCount: Int
     let verification: Verification

     enum CodingKeys: String, CodingKey {
         case author, committer, message, tree, url
         case commentCount = "comment_count"
         case verification
     }
 }

 // MARK: - CommitAuthorClass
 struct CommitAuthorClass: Codable {
     let name, email: String
     let date: Date
 }

 // MARK: - Tree
 struct Tree: Codable {
     let sha: String
     let url: String
 }

 // MARK: - Verification
 struct Verification: Codable {
     let verified: Bool
     let reason: Reason
     let signature, payload: String?
 }

 enum Reason: String, Codable {
     case unsigned = "unsigned"
     case valid = "valid"
 }

 // MARK: - Parent
 struct Parent: Codable {
     let sha: String
     let url, htmlURL: String

     enum CodingKeys: String, CodingKey {
         case sha, url
         case htmlURL = "html_url"
     }
 }

 typealias Commits = [Commit]

 
 
 */
