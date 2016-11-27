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
    
    var activity:Activity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(activity:Activity) {
        self.activity = activity
        self.activityTitle.text = activity.name
        self.activityDescription.text = activity.description
        self.timer.text = activity.start.convertToTime()
    }
    
}
