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

enum FlightStatus:String {
    case cancelled
    case delayed
    case ontime
}

struct Flight: Decodable {
    var key:String!
    var flightNumber:String!

    var arrivalAirport:String!
    var arrivalTime:Date!
    var arrivalTown:String!

    var departureAirport:String!
    var departureTime:Date!
    var departureTown:String!

    var company:String!
    var flightDuration:TimeInterval!
    var status:FlightStatus!
    var visibility:Bool!
    var duration:TimeInterval!
    var order:Int!
    var lastMessage:String!
    var terminalDeparture:String!

    
    init?(json: JSON) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        self.flightNumber = "flightNumber" <~~ json
        self.arrivalAirport = "arrivalAirport" <~~ json
        self.arrivalTown = "arrivalTown" <~~ json
        
        let arrivalTimeString:String? = "arrivalTime" <~~ json
        if let arrivalTimeString = arrivalTimeString {
            self.arrivalTime = dateFormatter.date(from: arrivalTimeString)
        } else {
            self.arrivalTime = nil
        }

        self.company = "company" <~~ json
        self.departureAirport = "departureAirport" <~~ json
        self.departureTown = "departureTown" <~~ json
        self.lastMessage = "lastMessage" <~~ json
        
        let departureTimeString:String? = "departureTime" <~~ json
        if let departureTimeString = departureTimeString {
            self.departureTime = dateFormatter.date(from: departureTimeString)
        } else {
            self.departureTime = nil
        }
        
        self.flightDuration = "flightDuration" <~~ json
        if let statusGrabbed:String = "status" <~~ json {
            self.status = FlightStatus(rawValue: statusGrabbed)
        } else {
            self.status = FlightStatus.delayed
        }
        self.visibility = "visibility" <~~ json
        self.order = "order" <~~ json
        self.terminalDeparture = "terminalDeparture" <~~ json
        self.duration = "duration" <~~ json
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
