//
//  CLPHomeViewController.swift
//  Clap
//
//  Created by Matthieu Labarrière on 26/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit
import Firebase


class CLPHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstrain: NSLayoutConstraint!
    
    /// didSet used to grow the tableview when the datasource has been updated
    var flights:[Flight]? {
        didSet {
            if let flights = flights, flights.count > 0 {
                tableViewHeightConstrain.constant = CGFloat(64+(flights.count * 110))
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Register Cell for tableview
        let cellNib = UINib(nibName: "CLPFlightTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CLPFlightTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// flights emptied on view will appear to ensure last version is used
        flights = [Flight]()
        Flight.getOriginalFlights { (flight) in
            if let flight = flight {
                self.flights?.append(flight)
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: Flight list management
/// Flight list view management
extension CLPHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let flights = flights else {
            return 0
        }
        
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CLPFlightTableViewCell", for: indexPath) as! CLPFlightTableViewCell
        cell.configure(flight: (flights?[indexPath.row])!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

