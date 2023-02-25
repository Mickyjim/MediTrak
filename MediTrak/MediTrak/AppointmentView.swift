//
//  AppointmentView.swift
//  MediTrak
//
//  Created by Michael Favre on 25/02/2023.
//

import SwiftUI

struct AppointmentView: View {
    @ObservedObject var viewModel: AppointmentsViewModel
    
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        self.showDatePicker = true
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Select date")
                            Spacer()
                            Text(dateString(from: selectedDate))
                        }
                    }
                    .foregroundColor(.blue)
                    .sheet(isPresented: $showDatePicker) {
                        DatePickerView(selectedDate: self.$selectedDate, showDatePicker: self.$showDatePicker)
                    }
                }
                
                Section(header: Text("Appointments")) {
                    if viewModel.appointments.isEmpty {
                        Text("No appointments for selected date")
                    } else {
                        ForEach(viewModel.appointments) { appointment in
                            NavigationLink(destination: AppointmentDetailView(appointment: appointment, viewModel: self.viewModel)) {
                                AppointmentRow(appointment: appointment)
                            }
                        }
                        .onDelete(perform: viewModel.deleteAppointment)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Appointments"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppointmentsViewModel()
        return AppointmentView(viewModel: viewModel)
    }
}

