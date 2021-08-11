//
//  ContentView.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 07.08.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
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
                    NavigationLink(destination: TeamDetailView(team: team)) {
                    HStack {
                    Text(team.name ?? "")
                    Text(team.city ?? "")
                    }
                    }
                }
                .onDelete(perform: deleteTeam)
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
    func deleteTeam(at offsets: IndexSet) {
        offsets.forEach { (index) in
            let team = teams[index]
            moc.delete(team)
            try? moc.save()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
