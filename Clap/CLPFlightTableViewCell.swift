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
        case .canceled:
            warningContainer.backgroundColor = UIColor(named: .redAF)
        case .retarded:
            warningContainer.backgroundColor = UIColor(named: .blueAF)
        }
        warningExplanation.tintColor = UIColor.white
        lastMessage.textColor = UIColor.white
    }
    
    func manageFlightLabels() {
        
    }
}
