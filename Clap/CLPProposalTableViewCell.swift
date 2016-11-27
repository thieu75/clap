//
//  CLPProposalTableViewCell.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit

class CLPProposalTableViewCell: UITableViewCell {
    @IBOutlet weak var freetimeLabel: UILabel!
    @IBOutlet weak var freetimeTitle: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var originReadableLabel: UILabel!
    @IBOutlet weak var destinationReadableLabel: UILabel!
    @IBOutlet weak var originAirportAbreviation: UILabel!
    @IBOutlet weak var destinationAirportAbreviation: UILabel!
    @IBOutlet weak var originTime: UILabel!
    @IBOutlet weak var destinationTime: UILabel!
    
    
    var package:Package!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(package:Package) {
        self.package = package
        let freetimeValue = package.totalFreeTime.convertDoubleToFormatedhours() ?? ""
        freetimeLabel.text = ("Temps disponible : "+freetimeValue).uppercased()
        freetimeTitle.text = package.title
        activityImage.image = UIImage(named: package.image)
        
        status.text = (package.flights?.first?.status).map { $0.rawValue }
        originReadableLabel.text = package.flights?.first?.departureTown
        destinationReadableLabel.text = package.flights?.last?.arrivalTown
        
        originAirportAbreviation.text = package.flights?.first?.departureAirport
        destinationAirportAbreviation.text = package.flights?.last?.arrivalAirport
        
        if let departuretime = package.flights?.first?.departureTime {
            originTime.text = departuretime.convertToDateAndTime()
        }
        
        if let arrivaltime = package.flights?.last?.arrivalTime {
            destinationTime.text = arrivaltime.convertToDateAndTime()
        }
        
    }
}
