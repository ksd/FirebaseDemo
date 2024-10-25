//
//  FirebaseService.swift
//  FirebaseDemo
//
//  Created by ksd on 25/10/2024.
//

import Foundation
import FirebaseFirestore

struct FirebaseService {
    
    private let dbCollection = Firestore.firestore().collection("users")
    private var listner: ListenerRegistration?
    
    mutating func setUpListner(callback: @escaping ([User])->Void) {
        listner = dbCollection.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            let users = documents.compactMap{ queryDocumentSnapshot -> User? in
                return try? queryDocumentSnapshot.data(as: User.self)
            }
            callback(users.sorted{$0.name < $1.name})
        }
    }
    
    mutating func tearDownListner() {
        listner?.remove()
        listner = nil
    }
    
    func addUser(user: User) {
        do {
            let _ = try dbCollection.addDocument(from: user.self)
        } catch {
            print(error)
        }
    }
    
    func deleteUser(user: User) {
        guard let documentID = user.id else { return }
        dbCollection.document(documentID).delete(){ error in
            if let error {
                print(error)
            }
        }
    }
    
}
