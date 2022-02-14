//
//  medListService.swift
//  RxReminder
//
//  Created by Sanjida Ayman Nisha on 2/13/22.
//  Copyright © 2022 Sanjida Nisha. All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserService {
    let database = Firestore.firestore()

    func get(collectionID: String, handler: @escaping ([appUser]) -> Void) {
        database.collection("medList")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(appUser.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
}
