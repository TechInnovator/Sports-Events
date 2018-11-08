//
//  SportsEventsViewController.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import UIKit

class SportsEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var sportsEventsTableView: UITableView!
  
    let jsonFileName = "sports_events"
    var sportsEvents: SportsEvents?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        sportsEvents = SportsEventsLoader.load(jsonFileName: jsonFileName)
        
        if sportsEvents == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsEvents?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sportsEventsTableView.dequeueReusableCell(withIdentifier: "sportsEventCell", for: indexPath)
        
        if let cell = cell as? SportsEventTableViewCell,
            let sportsEvent = sportsEvents?.events[indexPath.row] {
            cell.matchupLabel.text = sportsEvent.matchup
            cell.dateLabel.text = dateFormatter.string(from: sportsEvent.date)
            cell.sportImageView.image = UIImage(named: sportsEvent.sport.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SportsEventDetailViewController,
            let selectedIndexPath = sportsEventsTableView.indexPathForSelectedRow {
            destination.sportsEvent = sportsEvents?.events[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
