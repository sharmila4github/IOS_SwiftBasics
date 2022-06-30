//
//  ViewController.swift
//  sampleApp
//
//  Created by Raghav Deo on 03/04/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var pArray=[product?]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pArray.count
    }
    
    @IBOutlet weak var tableview: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .default, reuseIdentifier: "cell")
        let object=pArray[indexPath.row]
        cell.textLabel?.text=object?.pName
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func displayButtton(_ sender: Any) {
        tableview.dataSource=self
        tableview.reloadData()
       
    }
    @IBAction func newButton(_ sender: Any) {
        
    }
    @IBAction func saveButton(_ sender: Any) {
let pr=viewModel()
        let p=product()
        p.pId=pidTextField.text
        p.pName=pNameText.text
        p.pRate=Double(pRateText.text!)
        pArray.append(pr.getFromModel(id: p.pId, name: p.pName, rate: p.pRate))
        print(pArray.count)
for item in pArray
        {
    print(item!.pName!)
}
        let alert = UIAlertController(title: "Save product", message: "Do you want to save record?", preferredStyle: .alert)
        let okAction=UIAlertAction(title: "Ok", style: .default) { okaction in
            self.pidTextField.text=""
            self.pNameText.text=""
            self.pRateText.text=""
        }
        let cancelAction=UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var pRateText: UITextField!
    @IBOutlet weak var pNameText: UITextField!
    @IBOutlet weak var pidTextField: UITextField!

}

