//
//  medListFirebase.swift
//  RxReminder
//
//  Created by Sanjida Ayman Nisha on 2/13/22.
//  Copyright © 2022 Sanjida Nisha. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension appUser {
    static func build(from documents: [QueryDocumentSnapshot]) -> [appUser] {
        var listofmeds = [appUser]()
        for document in documents {
            listofmeds.append(appUser(medName: document["medName"] as? String ?? "",
                              medDes: document["medDes"] as? String ?? ""))
        }
        return listofmeds
    }
}
