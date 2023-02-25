//
//  AppointmentList.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import SwiftUI

struct AppointmentsList: View {
    @ObservedObject var appointmentsViewModel = AppointmentsViewModel()
    @State private var showingAddAppointmentView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(appointmentsViewModel.appointments) { appointment in
                    NavigationLink(destination: AppointmentDetailView(appointment: appointment, appointmentsViewModel: appointmentsViewModel)) {
                        AppointmentRow(appointment: appointment)
                    }
                }
                .onDelete { indexSet in
                    appointmentsViewModel.deleteAppointment(at: indexSet.first!)
                }
            }
            .navigationBarTitle("Appointments")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddAppointmentView.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                    })
            )
            .sheet(isPresented: $showingAddAppointmentView) {
                AddAppointmentView(appointmentsViewModel: appointmentsViewModel)
            }
        }
    }
}

struct AppointmentsList_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsList()
    }
}
