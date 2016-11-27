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
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        if let departuretime = package.flights?.first?.departureTime {
            let convertedDate = dateFormatter.string(from: departuretime)
            originTime.text = convertedDate
        }
        
        if let arrivaltime = package.flights?.last?.arrivalTime {
            let convertedDate = dateFormatter.string(from: arrivaltime)
            destinationTime.text = convertedDate
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension Double {
    func convertDoubleToFormatedhours() -> String? {
        let componentFormatter = DateComponentsFormatter()
        componentFormatter.unitsStyle = .positional
        componentFormatter.zeroFormattingBehavior = .dropAll
        return componentFormatter.string(from: self)
    }
}
