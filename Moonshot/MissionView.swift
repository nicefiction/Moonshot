// MARK: MissionView.swift

import SwiftUI



struct MissionView: View {
    
     // ///////////////////
    //  MARK: NESTED TYPES
    
    struct CrewMember {
        
        let role: String
        let astronaut: Astronaut
    }
    /**
     Because this merged data is only temporary
     we could use a tuple rather than a struct ,
     but honestly there isn’t really much difference
     so we’ll be using a new struct here .
     */
    // var crewMember: (role: String , astronaut: Astronaut)
    
    
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let mission: Mission
    // let matchedCrewMembers: [CrewMember]
    let astronauts: [CrewMember]
    
    
    
     // /////////////////////////
    //  MARK: COMPUTED PROPETIES
    
    var body: some View {
        
        GeometryReader { (geometry: GeometryProxy) in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        // Use the GeometryReader to set the maximum width of the image .
                        .frame(maxWidth : geometry.size.width * 0.75)
                        .padding(.top)
                    Text(mission.description)
                        .padding()
                    Spacer(minLength : 25)
                    /**
                     This ensures the `Spacer` has
                     a minimum _height_
                     of at least `25` points .
                     This is helpful inside scroll views
                     because the total available height is flexible :
                     a `Spacer` would normally take up all available remaining space ,
                     but that has no meaning inside a `ScrollView` .
                     
                     `NOTE`:
                     We could have accomplished the same result
                     using `Spacer().frame(minHeight: 25)` ,
                     but using `Spacer(minLength: 25)` has the advantage that
                     if you ever change your stack orientation
                     – if you go from a `VStack` to a `HStack` , for example
                     – then it effectively becomes `Spacer().frame(minWidth: 25)` .
                     */
                }
                ForEach(astronauts , id : \.astronaut.id) { (crewMember: CrewMember) in
                    // ForEach(self.astronauts, id: \.role) { crewMember in // PAUL HUDSON
                    NavigationLink(
                        destination : AstronautView(astronaut : crewMember.astronaut) ,
                        label : {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    // .scaledToFit()
                                    .frame(width : 83 , height: 60)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(lineWidth: 1.0)
                                            .foregroundColor(.primary))
                                // .stroke(Color.primary, lineWidth: 1)) // PAUL HUDSON
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        })
                        .buttonStyle(PlainButtonStyle()) // Removes the blue link color of the text .
                }
            }
        }
    }
    

    
    
    
     // //////////////////////////
    //  MARK: INITIALIZER METHODS
    
    init(mission: Mission ,
         astronauts: [Astronaut]) {
        
        self.mission = mission
        
        var matchedCrewMembers = Array<CrewMember>()
        
        
        for crewMember in mission.crew {
            
            if
                let _matchedAstronaut = astronauts.first(where : {
                    return $0.id == crewMember.name
            }) {
                matchedCrewMembers.append(CrewMember(role : crewMember.role ,
                                                     astronaut : _matchedAstronaut))
            } else {
                fatalError("Missing \(crewMember) .")
            }
        }
        
        self.astronauts = matchedCrewMembers
    }
}





 // //////////////
// MARK: PREVIEWS

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    
 
    static var previews: some View {
        
        MissionView(mission : missions[0] ,
                    astronauts : astronauts)
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
 
 
 
 
 
 
 `struct Astronaut: Codable ,`
                   `Identifiable {`
     
     `let id: String`
     `let name: String`
     `let description: String`
 `}`
 
 
 
 `struct Mission: Codable ,`
                 `Identifiable {`
 
    `struct CrewRole: Codable {`
 
       `let name: String`
       `let role: String`
    `}`
 
 
    `let id: Int`
    `var launchDate: Date?`
    `let crew: [CrewRole]`
    `let description: String`
 
 
    `var imageName: String { ... }`
    `var displayName: String { ... }`
    `var formattedLaunchDate: String { ... }`
 `}`
 
 
 
 `struct MissionView: View {`
 
    `struct CrewMember {`
 
       `let role: String`
       `let astronaut: Astronaut`
    `}`
 
 
    `let mission: Mission`
    `let astronauts: [CrewMember]`
 `}`
 */
