//
//  AddApointmentView.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import SwiftUI


struct AddAppointmentView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var appointmentsVM: AppointmentsViewModel
    
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                Section {
                    DatePicker("Date", selection: $selectedDate, displayedComponents: [.date])
                    DatePicker("Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
                Button(action: {
                    let appointment = Appointment(title: self.title, description: self.description, date: self.selectedDate, time: self.selectedTime)
                    self.appointmentsVM.addAppointment(appointment: appointment)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Appointment")
                }
                .disabled(title.isEmpty || description.isEmpty)
            }
            .navigationTitle("Add Appointment")
        }
    }
    
    struct AddAppointmentView_Previews: PreviewProvider {
        static var previews: some View {
            AddAppointmentView(appointmentsVM: AppointmentsViewModel())
        }
    }
}

