//
//  ViewController.swift
//  jsonWithGithubUrl
//
//  Created by Raghav Deo on 15/04/22.
//

import UIKit

class ViewController: UIViewController {
    let url="https://api.github.com/repositories/19438/commits"
    override func viewDidLoad() {
        super.viewDidLoad()
        //parseJson(url: url)
       // parseJsonClassical(url: url)
        encodeJson()
        // Do any additional setup after loading the view.
    }
    struct Users:Codable
    {
      var sha:String
        var node_id:String
        struct Commit:Codable
        {
            struct Author:Codable
            {
                let name: String
                let email:String
                let date:String
                      
            }
            let author:Author
            
        }
        let commit:Commit
        
    }
    func encodeJson()
    {
        
//        let dic = ["2": "B", "1": "A", "3": "C"]
//
//        let encoder=JSONEncoder()
//        do
//        {
//        let jsonData =  try encoder.encode(dic)
//            let jsonString=String(data: jsonData, encoding: .utf8)
//            print(jsonString!)
//        }
//       catch
//        {
//            print(error)
//        }
        var user = Users(sha: "sharmila", node_id: "001", commit: .init(author: .init(name: "aaa", email: "bbb", date: "ccc")))
        let encoder=JSONEncoder()
        do
        {
        let jsonData = try encoder.encode(user)
            let jsonString=String(data: jsonData, encoding: .utf8)
            print(jsonString!)
        }
        catch
        {
            print(error)
        }
        
       
        
        
    }
    
    
    
    func parseJsonClassical(url:String)
    {
        guard let url=URL(string: url) else
        {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data=data else
            {
                print("Data error")
                return
            }
            do
            {
                guard let ans = try JSONSerialization.jsonObject(with: data) as? [[String:Any]] else
                {
                    return
                }
                for dict in ans
                {
                    let commit=dict["commit"] as! [String:Any]
                    let author=commit["author"] as! [String:Any]
                    let name=author["name"] as! String
                    print(name)
                }
               
            }
            catch
            {
                print(error)
            }
                
        }.resume()
            
            
                    
        }
        
    

    func parseJson(url:String)
    {
        guard let url=URL(string: url) else
        {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data=data else
            {
                print("Data error")
                return
            }
            do
            {
                guard let ans = try? JSONDecoder().decode([Users].self, from: data) else
                {
                   throw error!
                }
                for item in ans{
                    print(item.commit.author.name)
                }
            }
            catch
            {
                print(error)
            }
                
        }.resume()
            
            
                    
        }
    

}
