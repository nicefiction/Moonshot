//  Bundle-Decodable.swift
/**
 We want to convert `astronauts.json`
 into an array of `Astronaut` instances ,
 which means
 we need to use `Bundle`
 (`1`) to find the path to the file ,
 (`2`) load that into an instance of `Data` ,
 and (`3`) pass it through a `JSONDecoder` .
 
 `NOTE`:
 Previously we used `String(contentsOf:)`
 to load files into a string ,
 but because `Codable` uses `Data`
 we are instead going to use `Data(contentsOf:)` .
 */

import Foundation



extension Bundle {
    
    /**
     Be very careful :
     There is a big difference between `T` and `[T]` .
     Remember , `T` is a placeholder for whatever type we ask for ,
     so if we say “decode an array of astronauts,”
     then `T` becomes `[Astronaut]` .
     If we attempt to return `[T]` from `decode()`
     then we would actually be returning `[[Astronaut]]`
     – an array of arrays of astronauts !
     */
    func decode<T: Codable>(_ file: String)
    // -> [Astronaut] {
    -> T {
        
        guard let _url = self.url(forResource : file ,
                                  withExtension : nil)
        else {
            fatalError("Failed to locate \(file) in the bundle .")
        }
        
        
        guard let _data = try? Data(contentsOf : _url)
        else {
            fatalError("Failed to load the \(file) from the bundle .")
        }
        
        
        let decoder = JSONDecoder()
        
        
        // guard let _loaded = try? decoder.decode([Astronaut].self , from : _data)
        guard let _loaded = try? decoder.decode(T.self , from : _data)
        else {
            fatalError("Failed to decode \(file) from the bundle .")
        }
        
        
        return _loaded
    }
}
