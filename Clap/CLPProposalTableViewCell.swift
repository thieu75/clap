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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
