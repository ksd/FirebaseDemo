//
//  UserController.swift
//  FirebaseDemo
//
//  Created by ksd on 25/10/2024.
//

import SwiftUI

@Observable
class UserController {
    var users = [User]()
    
    @ObservationIgnored
    private var firebaseService = FirebaseService()
    
    init(){
        firebaseService.setUpListner { fetchedUsers in
            self.users = fetchedUsers
        }
    }
    
    func findUsersBy(gender: User.Gender) {
        Task {
            await firebaseService.getUsersWith(gender: gender) { fetchedUsers in
                self.users = fetchedUsers
            }
        }
    }
    func delete(user: User){
        firebaseService.deleteUser(user: user)
    }
    func add(user: User){
        firebaseService.addUser(user: user)
    }
}
