//
//  DataService.swift
//  Clap
//
//  Created by Matthieu Labarrière on 26/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
import Gloss

class DataService {
    static let dataService = DataService()
    
    private var _BASE_REF = FIRDatabase.database().reference()
    var BASE_REF: FIRDatabaseReference {
        return _BASE_REF
    }
    
    private var _CONTENTS_REF = FIRDatabase.database().reference().child("contents")
    var CONTENTS_REF:FIRDatabaseReference {
        _CONTENTS_REF.keepSynced(true)
        return _CONTENTS_REF
    }
    
    private var _USER_REF = FIRDatabase.database().reference().child("users")
    var USER_REF:FIRDatabaseReference {
        return _USER_REF
    }
    
    private var _CURRENTUSER_REF = FIRDatabase.database().reference().child("users")
    var CURRENTUSER_REF:FIRDatabaseReference? {
        if let uid = UserDefaults.standard.value(forKey: "uid") as? String {
            return _USER_REF.child(uid)
        }
        
        if let user = FIRAuth.auth()?.currentUser {
            return _USER_REF.child(user.uid)
        }
        return nil
    }
    
    private var _ORIGINAL_FLIGHT_REF = FIRDatabase.database().reference().child("booking").child("flightsOriginal")
    var ORIGINAL_FLIGHT_REF:FIRDatabaseReference? {
        return _ORIGINAL_FLIGHT_REF
    }
    
    private var _PACKAGE_REF = FIRDatabase.database().reference().child("booking").child("packages")
    var PACKAGE_REF:FIRDatabaseReference? {
        return _PACKAGE_REF
    }
    
    
    
    
}
