//
//  TeamDetailView.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 11.08.2021.
//

import SwiftUI

struct TeamDetailView: View {
    
    @ObservedObject var team: Team
    @State private var isShownAddPlayerView = false
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView {
        VStack {
            if let players = team.players?.sortedArray(using: [NSSortDescriptor(keyPath: \Player.role, ascending: true)]) as? [Player] {
        List {
            ForEach(players) { player in
                HStack {
                Text("\(player.number)")
                Text(player.fullName ?? "Noname")
                Text(player.role ?? "None")
                }
            }
        }
        
        }
        
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShownAddPlayerView = true
                } label: {
                    Image(systemName: "plus.circle")
                }

            }
        }
        .sheet(isPresented: $isShownAddPlayerView) {
            NewPlayerView(team: team)
        }
        .environment(\.managedObjectContext, moc)
        .navigationTitle(team.name ?? "")
            
        }
    }
}

