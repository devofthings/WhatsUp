//
//  AddNewGroupView.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import SwiftUI

struct AddNewGroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var groupSubject: String = ""
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhitespace
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Group Subject", text: $groupSubject)
                        .padding()
                }
                Spacer()
            }.toolbar{
                ToolbarItem(placement: .principal) {
                    Text("New Group")
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        
                    }.disabled(!isFormValid)
                }
            }
        }
    }
}

struct AddNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGroupView()
    }
}
