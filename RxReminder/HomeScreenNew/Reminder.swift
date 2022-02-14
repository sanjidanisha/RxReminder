/*
 See LICENSE folder for this sample's licensing information.
 */

import Foundation

struct Reminder {
    var title: String
//    var dueDate: Date
    var notes: String
    var isComplete: Bool = false
}

extension Reminder {
    static var testData = [
        Reminder(title: "Lisinopril Tablets", notes: "Take one Lisinpril tablet along with water to help regulate your blood pressue"),
        Reminder(title: "Acetaminophen Tablets",  notes: "Take one Acetaminophen after eating to help your body pain", isComplete: true),
        Reminder(title: "Corticosteroids Tablets",  notes: "Take one in the morning before breakfast"),
        Reminder(title: "Atorvastatin ", notes: "Take one with or without food around the same time every day.", isComplete: true),
        Reminder(title: "Metroprolol", notes: "Take two times a day taken with morning and evening meals.", isComplete: true),
        Reminder(title: "Metformin",  notes: "Take two times a day with the morning and evening meals"),
        
//        Reminder(title: "Interview new project manager candidate", dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
//        Reminder(title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0), notes: "Think different"),
//        Reminder(title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0), notes: "Discuss trends with management"),
//        Reminder(title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0), notes: "Ask about space heaters"),
//        Reminder(title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0), notes: "v0.9 out on Friday")
    ]
}




