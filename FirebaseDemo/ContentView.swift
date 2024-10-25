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
            Button("Add User") {
                userController.add(user: User(name: "William"))
            }
        }
    }
}

#Preview {
    ContentView().environment(UserController())
}
