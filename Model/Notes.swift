//
//  Notes.swift
//  Notes- DevMoutain assessment #1
//
//  Created by Caston  Boyd on 5/11/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import Foundation


class Notes: Codable {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
}

extension Notes: Equatable {
    static func == (lhs: Notes, rhs: Notes) -> Bool {
        return
            lhs.text == rhs.text
}
}
