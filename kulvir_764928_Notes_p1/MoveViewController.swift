//
//  MoveViewController.swift
//  kulvir_764928_Notes_p1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return FoldersStucture.foldersData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "folderName", for: indexPath)
                  // let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
                  cell.textLabel?.text = FoldersStucture.foldersData[indexPath.row].folder
                  cell.imageView?.image = UIImage(named: "folder-icon")
                 cell.detailTextLabel?.text = "\(FoldersStucture.foldersData[indexPath.row].notes.count)"
                  // Configure the cell...

                  return cell
        
       }
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
