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
    var launchDate: String?
    let crew: [CrewRole]
    let description: String
}
