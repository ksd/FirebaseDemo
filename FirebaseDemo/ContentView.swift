//
//  ContentView.swift
//  FirebaseDemo
//
//  Created by ksd on 25/10/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(UserController.self) private var userController
    var body: some View {
        NavigationStack{
            List {
                ForEach(userController.users) { user in
                    HStack {
                        Text(user.name)
                            .font(.headline)
                        Text(user.id ?? "")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .foregroundStyle(.gray)
                    }
                }
                .onDelete { indexSet in
                    let user = userController.users[indexSet.first!]
                    userController.delete(user: user)
                }
                
            }
            .navigationTitle("Olsenbanden")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add User", systemImage: "plus") {
                        userController.add(user: User(name: "William", gender: User.Gender.male))
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Female Users") {
                        userController.findUsersBy(gender: .female)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(UserController())
}
