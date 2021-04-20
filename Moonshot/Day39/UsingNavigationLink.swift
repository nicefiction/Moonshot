//  UsingNavigationLink.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink
 
 Both `sheet()` and `NavigationLink`
 allow us to show
 a new view from the current one ,
 but the way they do it is different
 and you should choose them carefully :
 `NavigationLink` `is for showing details about the user’s selection ,
 like you are digging deeper into a topic .
 `sheet()` is for showing unrelated content ,
 such as settings or a compose window .
 The most common place you see `NavigationLink` is with a `List` .
 */

import SwiftUI



struct UsingNavigationLink: View {
    
    var body: some View {
        
        NavigationView {
            List(1..<10) { (rowNumber: Int) in
                NavigationLink(destination : Text("Detail row \(rowNumber)")) {
                    Text("Row \(rowNumber)")
                }
            } // PAUL HUDSON
            
//            List {
//                ForEach(1..<11) { (rowNumber: Int) in
//                    NavigationLink( destination : Text("Detailview \(rowNumber)")) {
//                        Text("Row \(rowNumber)")
//                    }
//                }
//            } // OLIVIER
            
//            NavigationLink(destination : Text("Destination")) {
//
//                Text("Navigate")
//            }
            .navigationTitle("SwiftUI")
        }
    }
}

/*
 List(0..<100) { row in
         NavigationLink(destination: Text("Detail \(row)")) {
             Text("Row \(row)")
         }
     }
     .navigationBarTitle("SwiftUI")
 */



struct UsingNavigationLink_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UsingNavigationLink().previewDevice("iPhone 12 Pro")
    }
}
