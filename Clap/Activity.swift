//
//  Activity.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Gloss


enum ActivityType:String {
    case transport
    
}

struct Activity: Decodable {
    var key:String!
    var type:ActivityType!
    var name:String!
    var start:Date!
    var end:Date!
    var duration:TimeInterval!
    var startLocation:String?
    var endLocation:String?
    var city:String?
    var description:String?
    
    
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
