// MARK: AstronautView.swift

import SwiftUI



struct AstronautView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let astronaut: Astronaut
    let missions: [Mission]
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var completedMissions: [Mission] {
        
        var matchedMissions = Array<Mission>()
        
        for mission in missions {
            for crewmember in mission.crew {
                if crewmember.name == astronaut.id {
                    matchedMissions.append(mission)
                }
            }
        }
        
        return matchedMissions
    }
    
    
    var body: some View {
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth : geometryProxy.size.width)
                        // .frame(maxWidth : geometryProxy.size.width) // PAUL HUDSON
                        .clipShape(Capsule())
                    ForEach(completedMissions , id : \.id) { (completedMission: Mission) in
                        Text(completedMission.displayName)
                            .font(.headline)
                    }
                    Text(astronaut.description)
                        .padding(.top)
                        // .padding() // PAUL HUDSON
                        // .layoutPriority(1) // This is no longer needed as Apple has solved the bug of clipping the text .
                    /**
                     Layout priority lets us control
                     how readily a view shrinks when space is limited ,
                     or expands when space is plentiful.
                     All views have a layout priority of 0 by default ,
                     which means they each get equal chance to grow or shrink .
                     We’re going to give our astronaut description a layout priority of 1 ,
                     which is higher than the image’s 0 ,
                     which means it will automatically take up all available space .
                     */
                }
                .padding()
            }
        }
        .navigationBarTitle(Text(astronaut.name) ,
                            displayMode:  .inline)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    static var previews: some View {
        
        AstronautView(astronaut : astronauts[0] ,
                      missions : missions)
    }
}
