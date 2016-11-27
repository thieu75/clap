//
//  Flight.swift
//  Clap
//
//  Created by Matthieu Labarrière on 26/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Gloss

enum FlightStatus:Int {
    case canceled = 0
    case retarded = 1
}

struct Flight: Decodable {
    var key:String!
    var flightNumber:String!
    var arrivalAirport:String!
    var arrivalTime:Date!
    var company:String!
    var departureAirport:String!
    var departureTime:Date!
    var flightDuration:TimeInterval!
    var status:FlightStatus!
    var visibility:Bool!
    
    
    
    init?(json: JSON) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        self.flightNumber = "flightNumber" <~~ json
        self.arrivalAirport = "arrivalAirport" <~~ json
        self.arrivalTime = dateFormatter.date(from: "2015-06-26T00:10:00+01:00")
        self.company = "company" <~~ json
        self.departureAirport = "departureAirport" <~~ json
        self.departureTime = dateFormatter.date(from: ("departureTime" <~~ json)!)
        self.flightDuration = "flightDuration" <~~ json
        if let statusGrabbed:Int = "status" <~~ json {
            self.status = FlightStatus(rawValue: statusGrabbed)
        } else {
            self.status = FlightStatus.retarded
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
    
    static func getOriginalFlights(callback:@escaping (_ result: Flight?)-> ()) {
        DataService.dataService.ORIGINAL_FLIGHT_REF?.observe(FIRDataEventType.childAdded, with: { (snapshot) in
            if snapshot.exists() {
                callback(Flight(snapshot: snapshot))
            }
        })
    }
}
