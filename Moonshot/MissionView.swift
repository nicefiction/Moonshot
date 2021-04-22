//  MissionView.swift

import SwiftUI



struct MissionView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let mission: Mission
    
    
    
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
            }
        }
    }
}





 // //////////////
// MARK: PREVIEWS

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
 
    static var previews: some View {
        
        MissionView(mission: missions[0])
    }
}
