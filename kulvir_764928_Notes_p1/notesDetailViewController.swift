//
//  notesDetailViewController.swift
//  kulvir_764928_Notes_p1
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class notesDetailViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    var textString: String?
    weak var notesTable : notesTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = textString ?? ""
    }
    override func viewWillDisappear(_ animated: Bool) {
        notesTable?.updateText(text: textView.text)
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
