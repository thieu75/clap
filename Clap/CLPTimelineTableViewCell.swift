//
//  CLPTimelineTableViewCell.swift
//  Clap
//
//  Created by Matthieu Labarrière on 27/11/2016.
//  Copyright © 2016 mlabarriere.af. All rights reserved.
//

import UIKit

class CLPTimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDescription: UITextView!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var activityPicto: UIImageView!
    
    var activity:Activity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        activityPicto.image = nil
    }

    func configure(activity:Activity) {
        self.activity = activity
        self.activityTitle.text = activity.name
        self.activityDescription.text = activity.description
        if activity.start != nil {
            self.timer.text = activity.start.convertToTime()
        }
        
        switch activity.type! {
        case .hotel:
            activityPicto.image = UIImage(named: "e-billet")
        case .entertainment:
            activityPicto.image = UIImage(named: "e-billet")
        case .embarkment:
            activityPicto.image = UIImage(named: "EmbarquementTicket")
        default:
            activityPicto.image = nil
        }
    }
    
}
