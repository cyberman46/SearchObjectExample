//
//  ViewController.swift
//  Sapp
//
//  Created by Akekapon Suebprom on 30/1/2561 BE.
//  Copyright © 2561 kratostracking. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var info  = [model]()
    var fillterData = [model]()
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.returnKeyType = UIReturnKeyType.done
        for i in 0..<5 {
            let Model = model()
            Model.name = "\(i)_akekapon"
            Model.email = "cyber_\(i)@gmail.com"
            info.append(Model)
        }

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return fillterData.count
        }
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell{
            
            if isSearching{
                cell.lbEmail.text = fillterData[indexPath.row].email
                cell.lbName.text = fillterData[indexPath.row].name
            }else{
                cell.lbName.text = info[indexPath.row].name
                cell.lbEmail.text = info[indexPath.row].email
                
            }
            
            return cell
        }else{
            return UITableViewCell()
        }

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isSearching{
            print(fillterData[indexPath.row].name)
        }else{
            print(info[indexPath.row].name)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }else{
            isSearching = true
            fillterData = info.filter({$0.name.contains(searchBar.text!)})
            
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

