//
//  AppointmentsViewModel.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import Foundation

class AppointmentsViewModel: ObservableObject {
    @Published var appointments = [Appointment]()
    
    func addAppointment(title: String, date: Date, notes: String?) {
        let newAppointment = Appointment(title: title, date: date, notes: notes)
        appointments.append(newAppointment)
    }
    
    func deleteAppointment(at index: Int) {
        appointments.remove(at: index)
    }
}
