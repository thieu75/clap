//
//  CLPTimelineViewController.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit

class CLPTimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var package:Package!
    var activities:[Activity]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let act = package.activities {
            activities = act.sorted(by: { (activity1:Activity, activity2:Activity) -> Bool in
                if activity1.start != nil {
                    if activity2.start != nil {
                        return activity1.start < activity2.start
                    } else {
                       return true
                    }
                } else {
                   return false
                }
            })
        }
        
        let nib = UINib(nibName: "CLPTimelineTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CLPTimelineTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

/// Flight list view management
extension CLPTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let activities = activities else {
            return 0
        }
        
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CLPTimelineTableViewCell", for: indexPath) as! CLPTimelineTableViewCell
        cell.configure(activity: activities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
