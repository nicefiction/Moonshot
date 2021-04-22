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
 we are instead going to use `Data(contentsOf:)`
 
 `NOTE`:
 Swift’s `JSONDecoder` type has a property called `dateDecodingStrategy` ,
 which determines how it should decode dates .
 We can provide that with a `DateFormatter` instance
 that describes how our dates are formatted .
 In this instance , our dates are written as year-month-day ,
 but things are rarely so simple in the world of dates :
 is the first month written as “1”, “01”, “Jan”, or “January”? Are the years “1968” or “68” ?
 We already used the `dateStyle` and `timeStyle` properties of `DateFormatter`
 for using one of the built-in styles ,
 but here we’re going to use its dateFormat property to specify a precise format : `“y-MM-dd”` .
 That is Swift’s way of saying
 “a year, then a dash, then a zero-padded month, then a dash, then a zero-padded day” ,
 with “zero-padded” meaning that January is written as “01” rather than “1” .
 
 `WARNING`:
 Date formats are case sensitive !
 `mm` means “zero-padded minute”
 and `MM` means “zero-padded month.”
 
 `WARNING`:
 When working with dates
 it is sometimes a good idea
 to be specific about your timezone ,
 otherwise the user’s own timezone is used .
 In this instance ,
 you could set the timeZone property to something like
 `timeZone = TimeZone(secondsFromGMT: 0)` ,
 which would make sure the dates get formatted the same for everyone
 regardless of where they live .
 However , make sure you update your code to display the time to match .
 
 `SOURCE`for date formatting :
 https://www.hackingwithswift.com/books/ios-swiftui/formatting-our-mission-view.
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        // That tells the decoder to parse dates in the exact format we expect.
        /* OLIVIER
         * Could this relate to the date format in the missions.json file ? ,
         * "launchDate": "1968-10-11"
         */
        
        // guard let _loaded = try? decoder.decode([Astronaut].self , from : _data)
        guard let _loaded = try? decoder.decode(T.self , from : _data)
        else {
            fatalError("Failed to decode \(file) from the bundle .")
        }
        
        
        return _loaded
    }
}


/*
 let dateFormatter = DateFormatter()
 dateFormatter.timeStyle = .short
 let dateString = dateFormatter.string(from : wakeUpDate)
 */
