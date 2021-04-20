//  HierarchicalCodableData.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/working-with-hierarchical-codable-data
 
 The `Codable` protocol makes it trivial to decode flat data :
 if you are decoding a single instance of a type ,
 or an array or dictionary of those instances ,
 then things Just Work . However ,
 in this project we are going to be decoding slightly more complex JSON :
 there will be an array inside another array ,
 using different data types .
 If you want to decode this kind of hierarchical data ,
 the key is to create separate types for each level you have .
 As long as the data matches the hierarchy you have asked for ,
 Codable is capable of decoding everything
 with no further work from us .
 */

import SwiftUI



struct HierarchicalCodableData: View {
    
    var body: some View {
        
        Button("Decode JSON") {
            
            // Creates a string of JSON in code :
            let input = """
            {
               "name" : "Dorothy"
               "address" : {
                  "street" : "Somestreet 12"
                  "city" : "Emerald"
               }
            }
            """
            
            // More code to come .
            
            struct User: Codable {
                
                var name: String
                var address: Address
            }
            
            
            struct Address: Codable {
                
                var street: String
                var city: String
            }
            
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if
                let _user = try? decoder.decode(User.self ,
                                                from : data) {
                
                print(_user.address.street)
            }
            /**
             If you run that program
             and tap the button
             you should see the address printed out .
             */
        }
    }
}





struct HierarchicalCodableData_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HierarchicalCodableData()
    }
}
