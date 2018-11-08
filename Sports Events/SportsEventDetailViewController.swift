//
//  SportsEventDetailViewController.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import UIKit

class SportsEventDetailViewController: UIViewController {
    @IBOutlet weak var sportImageView: UIImageView!
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    var sportsEvent: SportsEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        if let sportsEvent = sportsEvent {
            matchupLabel.text = sportsEvent.matchup
            dateLabel.text = dateFormatter.string(from: sportsEvent.date)
            sportImageView.image = UIImage(named: sportsEvent.sport.rawValue)
        }
    }
}
