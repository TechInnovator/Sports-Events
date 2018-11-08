//
//  SportsEventsLoader.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import Foundation

class SportsEventsLoader {
    
    class func load(jsonFileName: String) -> SportsEvents? {
        var sportsEvents: SportsEvents?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                sportsEvents = try? jsonDecoder.decode(SportsEvents.self, from: jsonData)
        }
        
        return sportsEvents
    }
}
