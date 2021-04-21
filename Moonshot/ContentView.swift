// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            //  List(missions) { mission in // PAUL HUDSON
            List {
                ForEach(missions) { (mission: Mission) in
                    NavigationLink(destination : Text("Detailview \(mission.displayName)")) {
                        HStack {
                            Image(mission.imageName)
                                .resizable()
                                // .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width : 44 , height : 44)
                            VStack(alignment : .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                // Text(mission.launchDate ?? "N/A")
                                Text(mission.formattedLaunchDate)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Moonshot"))
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
