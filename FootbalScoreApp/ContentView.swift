//
//  ContentView.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 07.08.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @FetchRequest(entity: Team.entity(), sortDescriptors: []) var teams: FetchedResults<Team>
    @State private var isShowingNewTeamView = false
    
    var body: some View {
        NavigationView {
            VStack {
            NavigationLink(destination: NewTeamView(), isActive: $isShowingNewTeamView) {
                EmptyView()
            }
            
            List {
                ForEach(teams) { team in
                    Text(team.name ?? "")
                }
            }
            }
            .navigationTitle("FootbalScore")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingNewTeamView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
