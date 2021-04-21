// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Text("\(astronauts.count)")
            .font(.title)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
