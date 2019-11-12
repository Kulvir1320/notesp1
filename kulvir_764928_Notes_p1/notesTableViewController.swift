//
//  notesTableViewController.swift
//  kulvir_764928_Notes_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class notesTableViewController: UITableViewController {
//    var notes: [String]?
    @IBOutlet weak var delete: UIBarButtonItem!
    @IBOutlet weak var move: UIBarButtonItem!
    var currentIndex = -1
    var FoldersDelegate: foldersTableViewController?
   
    @IBOutlet var notesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        notes = []
        delete.isEnabled = false
        move.isEnabled = false
        tableView.allowsMultipleSelection = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return FoldersStucture.foldersData.[(FoldersDelegate?.curIndex)!].no
        return FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard notes != nil else {
//            return UITableViewCell()
//      }
       if let cell = tableView.dequeueReusableCell(withIdentifier: "notesName") {
//        cell.textLabel?.text = notes![indexPath.row]
        cell.textLabel?.text = FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes[indexPath.row]
//        // Configure the cell...
//
       return cell
       }
        return UITableViewCell()
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
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
        
        if let detailview = segue.destination as? notesDetailViewController {
            detailview.notesTable = self
            
          if let tableViewCell = sender as? UITableViewCell{
            if let index = tableView.indexPath(for: tableViewCell)?.row {
//              detailview.textString = notes![index]
                detailview.textString = FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes[index]
//                detailview.textString = FoldersStucture.foldersData[index].notes
                  currentIndex = index
//            }
              }
//
    
        }
    }
        }

    
    func updateText(text: String) {
        
        tableView.reloadData()
        FoldersDelegate?.reloadfolder()
        guard FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes != [] && currentIndex != -1 else {
            
            FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes.append(text)
            tableView.reloadData()
            FoldersDelegate?.reloadfolder()
            return
        }
        
        FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes[currentIndex] = text
         let indexPath = IndexPath(item: currentIndex, section: 0)
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
    
        delete.isEnabled = true
               move.isEnabled = true
    }
  
    
    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Delete", message: "Are you sure", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (action ) in
            self.deleteRow()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
         self.present(alertController, animated: true, completion: nil)
        
    }
     func deleteRow()
     {
        if let selectedRows = tableView.indexPathsForSelectedRows{
            var item = [String]()
            for indexPath in selectedRows{
                item.append(FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes[indexPath.row])
            }
            for i in item {
                if let index = FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes.index(of: i)
                {
                    FoldersStucture.foldersData[(FoldersDelegate?.curIndex)!].notes.remove(at: index)
                }
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
}
