// MARK: ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isShowingCrewMembers: Bool = true
    
    
    
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
                    NavigationLink(destination : MissionView(mission : mission ,
                                                             astronauts : astronauts ,
                                                             missions : missions)) {
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
                                Text(isShowingCrewMembers ? astronauts[0].name : mission.formattedLaunchDate)
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



// //////////////////
//  MARK: OBJECTGRAPH

/**
`struct Astronaut: Codable`
   `let id: String`
   `let name: String`
   `let description: String`

`struct Mission: Codable`
   `struct CrewRole: Codable`
       `let name: String`
       `let role: String`
   `let id: Int`
   `var launchDate: Date?`
   `let crew: [CrewRole]`
   `let description: String`

`struct MissionView: View`
   `struct CrewMember`
      `let role: String`
      `let astronaut: Astronaut`
   `let mission: Mission`
   `let astronauts: [CrewMember]`
 */
