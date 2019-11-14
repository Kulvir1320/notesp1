//
//  MoveViewController.swift
//  kulvir_764928_Notes_p1
//
//  Created by MacStudent on 2019-11-12.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var notesDelegate: notesTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return FoldersStucture.foldersData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
                let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
                  cell.textLabel?.text = FoldersStucture.foldersData[indexPath.row].folder
                 
                  // Configure the cell...

                  return cell
        
        
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let alertController = UIAlertController(title: "Move to \(FoldersStucture.foldersData[indexPath.row].folder)", message: "Are you sure", preferredStyle: .alert)
           let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
           let yesAction = UIAlertAction(title: "Move", style: .default) { (action) in
            self.notesDelegate?.movingNotes(index: indexPath.row)
//               self.notesDelegate?.movingNotes(index: indexPath.row)
               self.presentingViewController?.dismiss(animated: true, completion: nil)
           }
           alertController.addAction(noAction)
           alertController.addAction(yesAction)
           self.present(alertController, animated: true, completion: nil)
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
