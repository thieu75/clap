//
//  Package.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Gloss


struct Package: Decodable {
    var key:String!
    var flights:[Flight]?
    var activities:[Activity]?
    var image:String!
    var title:String!
    var totalFreeTime:Double!
        
    init?(json: JSON) {
        self.image = "imgpath" <~~ json
        self.title = "title" <~~ json
        self.totalFreeTime = "totalfreetime" <~~ json
        
        let flightsDatas:[String:Any]? = "flightsOption" <~~ json
        if let flightsDatas = flightsDatas {
            let datas = Array(flightsDatas.values)
            if datas.count > 0 {
                flights = [Flight]()
                for data in datas {
                    flights!.append(Flight(json: data as! JSON)!)
                }
            }
        }
        
        let activitiesDatas:[String:Any]? = "activities" <~~ json
        if let activitiesDatas = activitiesDatas {
            let datas = Array(activitiesDatas.values)
            if datas.count > 0 {
                activities = [Activity]()
                for data in datas {
                    activities!.append(Activity(json: data as! JSON)!)
                }
            }
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
    
    static func getPackagesForUser(callback:@escaping (_ result: Package?)-> ()) {
        DataService.dataService.PACKAGE_REF?.observe(FIRDataEventType.childAdded, with: { (snapshot) in
            if snapshot.exists() {
                callback(Package(snapshot: snapshot))
            }
        })
    }
}
