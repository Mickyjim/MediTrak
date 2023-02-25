//
//  AppointmentRow.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import SwiftUI

struct AppointmentRow: View {
    var appointment: Appointment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(appointment.patientName)
                    .font(.headline)
                Text(appointment.date, style: .date)
            }
            
            Spacer()
            
            if appointment.completed {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AppointmentRow_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentRow(appointment: Appointment(patientName: "John Doe", date: Date(), completed: false))
    }
}


