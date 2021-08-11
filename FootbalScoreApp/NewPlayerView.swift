//
//  NewPlayerView.swift
//  FootbalScoreApp
//
//  Created by Vladimir on 11.08.2021.
//

import SwiftUI

struct NewPlayerView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var team: Team
    @State private var fullName: String = ""
    @State private var age: String = ""
    @State private var role: String = ""
    @State private var number: String = ""
    let possibleRoles = ["Goalkeeper", "Defender", "Midfielder", "Forward", "Left winger", "Right winger"]
    
    var body: some View {
            
            VStack(spacing: 10) {
                Spacer()
            Text("Enter information about new player:")
            TextField("Full name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
                
            Picker("Choose role", selection: $role) {
                ForEach(possibleRoles, id:\.self) { item in
                    Text(item)
                }
            }
            
            TextField("Number", text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button {
                
                let newPlayer = Player(context: moc)
                
                newPlayer.fullName = fullName
                newPlayer.age = Int16(age)!
                newPlayer.role = role
                newPlayer.number = Int16(number)!
                newPlayer.team = team
                
                try? moc.save()
                
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.primary, lineWidth: 1))
            }
            .disabled(Int16(age) == nil || Int16(number) == nil || fullName == "" || role == "")
                
        Spacer()
            
        }
            .padding()
    }
    
    
}
