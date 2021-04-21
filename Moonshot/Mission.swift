//  Mission.swift

import Foundation



struct Mission: Codable ,
                Identifiable {
    
     // ///////////////////
    //  MARK: NESTED TYPES
    
    struct CrewRole: Codable {
        
        let name: String
        let role: String
    }
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let id: Int
    // var launchDate: String?
    var launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var imageName: String {
        
        return "apollo\(id)"
    }
    
    
    var displayName: String {
        
        return "Apollo \(id)"
    }
    
    
    var formattedLaunchDate: String {
        
        if
            let _launchDate = launchDate {
            /**
             `WARNING`:
             Remember I had a warning about timezones earlier — see `Mission.swift` ?
             Yep , same thing here – if you want to pick a standard timezone ,
             use it for both loading and displaying your data .
             */
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            
            return dateFormatter.string(from : _launchDate)
            
        } else {
            return "N/A"
        }
    }
}
