//  Astronauts.swift
/**
 I have made that conform to `Codable`
 so we can create instances of this struct straight from JSON .
 `Codable` is just an alias for two separate protocols :
 `Encodable` and `Decodable` .
 You can use `Codable` if you want ,
 or you can use `Encodable` and `Decodable` if you prefer being specific
 – it is down to you .
 */

import Foundation



struct Astronaut: Codable ,
                  Identifiable {
    
    let id: String
    let name: String
    let description: String
}
