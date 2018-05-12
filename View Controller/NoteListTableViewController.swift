//
//  NoteListTableViewController.swift
//  Notes- DevMoutain assessment #1
//
//  Created by Caston  Boyd on 5/11/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return NotesController.sharedController.notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creates the cell path
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        //places data in cell
        let notes = NotesController.sharedController.notes[indexPath.row]
        
        // assigns particular data from model to cell
        cell.textLabel?.text = notes.text

        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteEntry = NotesController.sharedController.notes[indexPath.row]
            NotesController.sharedController.deleteNote(note: noteEntry)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //search a certain segue
        if segue.identifier == "toAddNotesVC"{
            
            //moving information from one controller to another requires
            //creating the destination segue
            // also that data is now accessible to the object created
            // thus, if there is a segue destination:
            if let destinationVC = segue.destination as? NoteViewController,
            /// and allow something to happen to a particular cell
                let indexPath = tableView.indexPathForSelectedRow?.row{
                ///therefore create a constant that gathers that paticular row
                /// from the array with the data in it
                let note = NotesController.sharedController.notes[indexPath]
                ///
                destinationVC.note = note
            }
            
            
            
            
        }
        
      
    }

}
