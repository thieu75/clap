//
//  CLPFlightTableViewCell.swift
//  Clap
//
//  Created by Matthieu Labarrière on 26/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit

class CLPFlightTableViewCell: UITableViewCell {
    @IBOutlet weak var warningContainer: UIView!
    @IBOutlet weak var warningPicto: UIImageView!
    @IBOutlet weak var lastMessage: UILabel!

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var originReadableLabel: UILabel!
    @IBOutlet weak var destinationReadableLabel: UILabel!
    @IBOutlet weak var originAirportAbreviation: UILabel!
    @IBOutlet weak var destinationAirportAbreviation: UILabel!
    @IBOutlet weak var originTime: UILabel!
    @IBOutlet weak var destinationTime: UILabel!
    
    var flight:Flight!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(flight:Flight) {
        self.flight = flight
        manageWarningSpace()
        manageFlightLabels()
    }

    func manageWarningSpace() {
        switch flight.status! {
        case .cancelled:
            warningContainer.backgroundColor = UIColor(named: .redAF)
            status.textColor = UIColor(named: .redAF)
        case .delayed:
            warningContainer.backgroundColor = UIColor(named: .orangeAF)
            status.textColor = UIColor(named: .orangeAF)
        case .ontime:
            warningContainer.backgroundColor = UIColor(named: .blueAF)
            status.textColor = UIColor(named: .blueAF)
        }
        warningPicto.tintColor = UIColor.white
        lastMessage.textColor = UIColor.white
    }
    
    func manageFlightLabels() {
        lastMessage.text = flight.lastMessage
        status.text = flight.status.rawValue
        
        originReadableLabel.text = flight.departureTown
        originAirportAbreviation.text = flight.departureAirport
        destinationReadableLabel.text = flight.arrivalTown
        destinationAirportAbreviation.text = flight.arrivalAirport
        
        if let departuretime = flight.departureTime {
            originTime.text = departuretime.convertToDateAndTime()
        }
        
        if let arrivaltime = flight.arrivalTime {
            destinationTime.text = arrivaltime.convertToDateAndTime()
        }
    }
}
