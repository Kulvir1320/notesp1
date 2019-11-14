//
//  foldersTableViewController.swift
//  kulvir_764928_Notes_p1
//
//  Created by MacStudent on 2019-11-07.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class foldersTableViewController: UITableViewController {
   // var folders: [String]?
    var curIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = .white
       // folders = []
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .lightGray
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FoldersStucture.foldersData.count
        
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard folders != nil else {
//            return UITableViewCell()
//        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "folderName") {
        // let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.textLabel?.text = FoldersStucture.foldersData[indexPath.row].folder
        cell.imageView?.image = UIImage(named: "folder-icon")
       cell.detailTextLabel?.text = "\(FoldersStucture.foldersData[indexPath.row].notes.count)"
            cell.detailTextLabel?.textColor = UIColor.white
        // Configure the cell...

        return cell
    }
        return UITableViewCell() }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actions = UIContextualAction(style: .destructive, title: "Delete") { (action, view, _) in
            FoldersStucture.foldersData.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        
        return UISwipeActionsConfiguration(actions: [actions])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            folders?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/ func reloadfolder()
{
    tableView.reloadData()
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detail = segue.destination as? notesTableViewController{
            detail.FoldersDelegate = self
            
            if let tableViewCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableViewCell)?.row {
                curIndex = index
                }
            }
        }
    }
    
    
    @IBAction func newFolder(_ sender: Any) {

         let altercontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
         
        
         altercontroller.addTextField { (textField) in
             textField.placeholder = "name"
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        cancelAction.setValue(UIColor.orange, forKey: "titleTextColor")
        altercontroller.addAction(cancelAction)
        
        altercontroller.addAction(UIAlertAction(title: "Add item", style: .default, handler: { (action) in
             
            let name = altercontroller.textFields?.first?.text
             let foldername = FoldersStucture(folder: name!, notes: [])
            
            var flag = false
            for i in FoldersStucture.foldersData {
                let name = foldername.folder
                if name == i.folder{
                   flag = true
                    break
                }
                
            }
                if flag
                {
                   let alter = UIAlertController(title: "Name Taken", message: "Please choose a diifrent name", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                    alter.addAction(okAction)
                     self.present(alter, animated: true, completion: nil)
                }
                else {
                    FoldersStucture.foldersData.append(foldername)
                               self.tableView.reloadData()
                }
            } ))

        self.present(altercontroller, animated: true, completion: nil)
        altercontroller.view.tintColor = UIColor.black
}

}
