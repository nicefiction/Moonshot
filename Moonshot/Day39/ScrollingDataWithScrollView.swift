//  ScrollingDataWithScrollView.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data
 
 You have seen how `List` and `Form` let us create scrolling tables of data ,
 but for times when we want to scroll arbitrary data
 – i.e., just some views we have created by hand
 – we need to turn to SwiftUI’s `ScrollView` .
 */

import SwiftUI



struct CustomText: View {
    
    var text: String
    
    
    
    var body: some View {
        
        Text(text)
    }
    
    
    
    init(text: String) {
        
        print("Printing : \(text)")
        self.text = text
    }
}





struct ScrollingDataWithScrollView: View {
    
    var body: some View {
        
        HStack {
            ScrollView(.vertical) {
                VStack(spacing : 10) {
                    ForEach(1..<100) { (number: Int) in
                        
                        // Text("Day \(number)")
                        CustomText(text: "Scroll \(number)")
                    }
                }
                .frame(maxWidth : .infinity) // makes the whole area scrollable
            }
            /**
             There is an important catch however
             that you need to be aware of :
             when we add views to a scroll view
             they get created immediately .
             You can try the same experiment with a `List` .
             When that code runs you’ll see it acts _lazily_ :
             it creates instances of CustomText only when really needed .
             */
            List {
                ForEach(1..<100) {
                    // Text("List \($0)")
                    CustomText(text : "List \($0)")
                }
            }
        }
    }
}





struct ScrollingDataWithScrollView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ScrollingDataWithScrollView().previewDevice("iPhone 12 Pro")
    }
}
