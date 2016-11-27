//
//  User.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Gloss


struct User: Decodable {
    var key:String!
    var name:String!
    var surname:String!
    var cabinCode:String!
    var gender:String!
    var regime:String?

    init?(json: JSON) {
        
    }
    
    init?(snapshot:FIRDataSnapshot) {
        if let value = snapshot.value {
            self.init(json: value as! JSON)
            self.key = snapshot.key
        } else {
            return nil
        }
    }

}
