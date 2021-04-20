//  GeometryReaderView.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/resizing-images-to-fit-the-screen-using-geometryreader
 
 GeometryReader is a view just like the others we have used ,
 except when we create it
 we will be handed a `GeometryProxy` object to use .
 This lets us query the environment :
 _How big is the container ?_
 _What position is our view ?_
 _Are there any safe area insets ?_
 And so on .
 We can use this geometry proxy to set the width of our image ,
 like this :
 */

import SwiftUI



struct GeometryReaderView: View {
    
    var body: some View {
        
        VStack {
            GeometryReader { (geometry: GeometryProxy) in
                Image("midsommar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
            }
            /**
             We have given SwiftUI enough information
             that it can automatically figure out the `height` :
             it knows the original `width` ,
             it knows our target `width` ,
             and it knows our _content mode_ ,
             so it understands how the target `height` of the image
             will be proportional to the target `width` .
             */
        }
            
    }
}





struct GeometryReaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GeometryReaderView().previewDevice("iPhone 12 Pro")
    }
}
