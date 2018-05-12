//
//  NoteViewController.swift
//  Notes- DevMoutain assessment #1
//
//  Created by Caston  Boyd on 5/11/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updatesViews()

    }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true 
            
        }
        
        
       private func updatesViews() {
            if let note = note{
                noteTextView.text = note.text
            }
            
        
        
        
        //MARK: Actions
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        ///what are we saving
        guard let noteText = noteTextView.text else { return }
        /// if the note has not been added
        if self.note == nil {
            NotesController.sharedController.addNote(text: noteText)
            ///place back on main screen
            self.navigationController?.popViewController(animated: true)
            
        
        } else {
            /// if the note has info already, update it
            guard let note = note else  { return }
            NotesController.sharedController.updateNote(note: note, text: noteText)
            ///then place it back on the main screen
            self.navigationController?.popViewController(animated: true)
            
            
        }
        
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        noteTextView.text = ""
    }
    
    
    
    
        //MARK: Properties
    var note: Notes?
    @IBOutlet weak var noteTextView: UITextView!

}
