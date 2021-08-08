//
//  NewTeamView.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 07.08.2021.
//

import SwiftUI
import CoreData

struct NewTeamView: View {
    
    @State private var city: String = ""
    @State private var name: String = ""
    @State private var regDate: Date = Date()
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
        VStack(spacing: 30) {
            
            TextField("Enter city: (London, Moscow, Madrid, etc.)", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter name: (Juventus, Lester, Spartak, etc.)", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                let newTeam = Team(context: moc)
                newTeam.name = name
                newTeam.city = city
                newTeam.regDate = Date()
                print("Saving")
                do {
                    try moc.save()
                } catch {
                    print("Error while saving moc: \(error)")
                }
                
                self.presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("Save Team")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.green)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.gray)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .padding()
        }
    }
}

struct NewTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeamView()
    }
}
