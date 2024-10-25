//
//  UserModel.swift
//  FirebaseDemo
//
//  Created by ksd on 25/10/2024.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
}
