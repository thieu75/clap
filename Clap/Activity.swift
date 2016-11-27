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
    var duration:Double!
    var startLocation:String?
    var endLocation:String?
    var city:String?
    var description:String?
    
    
    init?(json: JSON) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        self.city = "city" <~~ json
        self.description = "description" <~~ json
        self.duration = "duration" <~~ json
        self.end = dateFormatter.date(from: ("end" <~~ json)!)
        self.endLocation = "endLocation" <~~ json
        self.name = "name" <~~ json
        self.start = dateFormatter.date(from: ("start" <~~ json)!)
        self.startLocation = "startLocation" <~~ json
        
        let typeString:String? = "type" <~~ json
        if let typeString = typeString {
            self.type = ActivityType(rawValue: typeString)
        }
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
