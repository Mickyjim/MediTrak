//
//  Appointment.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import Foundation

struct Appointment: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var notes: String?
}


