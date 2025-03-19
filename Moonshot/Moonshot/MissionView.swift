//
//  MissionView.swift
//  Moonshot
//
//  Created by Jeff Xie on 3/13/25.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewView: View {
    let crew: [CrewMember]

    init(crew: [CrewMember]) {
        self.crew = crew
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text("Mission Launch: \(mission.formattedLaunchDate)")
                Text("Mission Members: ")
                ForEach(crew, id: \.role) { crewMember in
                    Text(crewMember.astronaut.name)
                }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(crew, id: \.role) { crewMember in
//                            NavigationLink {
//                                AstronautView(astronaut: crewMember.astronaut)
//                            } label: {
//                                HStack {
//                                    Image(crewMember.astronaut.id)
//                                        .resizable()
//                                        .frame(width: 104, height: 72)
//                                        .clipShape(.capsule)
//                                        .overlay(
//                                            Capsule()
//                                                .strokeBorder(.white, lineWidth: 1)
//                                        )
//                                    
//                                    VStack(alignment: .leading) {
//                                        Text(crewMember.astronaut.name)
//                                            .foregroundStyle(.white)
//                                            .font(.headline)
//                                        Text(crewMember.role)
//                                            .foregroundStyle(.white.opacity(0.5))
//                                    }
//                                }
//                                .padding(.horizontal)
//                            }
//                        }
//                    }
//                }
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
