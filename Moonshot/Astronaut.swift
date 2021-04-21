//  Astronauts.swift
/**
 I have made that conform to Codable
 so we can create instances of this struct straight from JSON .
 */

import Foundation



struct Astronaut: Codable ,
                  Identifiable {
    
    let id: String
    let name: String
    let description: String
}
