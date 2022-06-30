//
//  ViewController.swift
//  jsonWithNestedDict
//
//  Created by Raghav Deo on 15/04/22.
//

import UIKit

class ViewController: UIViewController {
    enum jsonErrors:String,Error
    {
        case responseError="No response"
        case dataError="No data"
        case conversionError="Check data types again,Conversion Failed"
    }
    
    struct Response:Decodable
    {
       
        struct Query:Decodable
        {
            let random:[Random]
        }
        struct Random:Decodable
        {
            let id,ns:Int
            let title:String
            
        }
        struct Continue: Codable {
               let rncontinue, continuecontinue: String

               enum CodingKeys: String, CodingKey {
                   case rncontinue
                   case continuecontinue = "continue"
               }
           }

           let batchcomplete: String
           let `continue`: Continue
           let query: Query

           
        
    }
   
    
    
let url="https://en.wikipedia.org/w/api.php?action=query&list=random&rnlimit=1&format=json"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJson(url: url)
    }
    func parseJson(url:String)
    {
        guard let url=URL(string: url) else
        {
            print("Error in Url!Please check")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            do
            {
                guard let response=response else
                {
                   
                throw jsonErrors.responseError
                }
                print(" rsponse:\(response)")
                guard let data=data else
                {
                    throw jsonErrors.dataError
                }
                let ans = try JSONDecoder().decode(Response.self, from: data)
                guard let title = ans.query.random.first?.title else{
                    return
                }
                print("Title=\(title)")
            }
            catch  let jsonErrors
            {
                print(jsonErrors)
            }
            
                }.resume()
        
    }
    
}
