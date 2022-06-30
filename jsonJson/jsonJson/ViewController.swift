//
//  ViewController.swift
//  jsonJson
//
//  Created by Raghav Deo on 14/04/22.
//

import UIKit

class ViewController: UIViewController {
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://jsonplaceholder.typicode.com/todos"
        parseJson(url: url)
        // Do any additional setup after loading the view.
    }
    enum jsonErros:String,Error
    {
        case noResponse="Response error"
        case NoData="Data Error"
        case conversionError = "Conversion Failed"
    }
    struct User:Decodable
    {
        
        var  userId:Int
        var id: Int
        var title: String
        var completed: Bool
          
    }
    
    func parseJson(url:String?)
    {
        guard let url = URL(string: url!) else
        {
            print("")
            return
        }
        
      URLSession.shared.dataTask(with: url) { data, response, error in
            do
                
            {
            guard let response = response else {
                throw jsonErros.noResponse
            }
            guard let data = data else {
                throw jsonErros.NoData
            }
            
                guard  let arr =  try? JSONDecoder().decode([User].self, from: data) else{
                    throw jsonErros.conversionError
                }
           print("array=\(arr)")
                for item in arr
                {
                    print(item.title)
                }

               
                                             
            }
          catch let   jsonErros
          {
              print(jsonErros.localizedDescription)
          }
            
      }.resume()
        
        
    }


}

