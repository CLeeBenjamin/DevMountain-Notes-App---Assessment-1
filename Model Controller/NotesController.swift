//
//  NotesController.swift
//  Notes- DevMoutain assessment #1
//
//  Created by Caston  Boyd on 5/11/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation


class NotesController{
    
    //1.) CRUD
    //2.) SharedInstance
    //3.) Source of Truth
    
    
    static let sharedController = NotesController()
    
    
    init() {
         self.notes = load()
    }
    
    ///Persisting Data
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "notes.json"
        let documentURLDirectory = urls[0].appendingPathComponent(fileName)
        return documentURLDirectory
        
        
    }
    
    /// use file
    func save () {
        let jsonEncoder = JSONEncoder()
            ///set up do catch ...
        do {
            let data = try jsonEncoder.encode(notes)
            
            try data.write(to: fileURL())
            
            
            
        } catch let error {
            print("File URLs saving to path \(#function) \(error) \(error.localizedDescription)")
            
        }
    
    }

    func load()-> [Notes]{
        
        let jsonDecoder = JSONDecoder()
        do{
            let data = try Data(contentsOf: fileURL())
            let notes = try jsonDecoder.decode([Notes].self, from: data)
            
            return notes
            
        } catch let error {
            print("Error loading notes from URL: \(#function) \(error) \(error.localizedDescription)")
            
            return []
            
        }
    }
    
    
    
  
    
    //C
    func addNote(text: String){
        let note = Notes(text: text)
        notes.append(note)
        save()
    }
    
    
    //R
    
    //U
    
    func updateNote(note: Notes, text: String){
        note.text = text
        save()
    }
    
    
    //D
    func deleteNote(note: Notes) {
        guard let index = notes.index(of: note) else { return }
        notes.remove(at: index)
        save()
        
    }

      var notes = [Notes]()
    
}
