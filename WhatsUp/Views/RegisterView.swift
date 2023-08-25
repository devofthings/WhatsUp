//
//  RegisterView.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        // TODO: Add RegEx for email field
        !email.isEmptyOrWhitespace && !password.isEmptyOrWhitespace && !displayName.isEmptyOrWhitespace
    }
    
    private func registerUser() async {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for:  result.user, displayName: displayName)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email).textInputAutocapitalization(.never).keyboardType(.emailAddress)
            SecureField("Password", text: $password).textInputAutocapitalization(.never)
            TextField("Display name", text: $displayName)
            
            HStack {
                Spacer()
                Button("Register") {
                    Task {
                        await registerUser()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Button("Login"){
                    appState.routes.append(.login)
                }.buttonStyle(.borderless)
                Spacer()
            }
            
            Text(errorMessage)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(Model())
            .environmentObject(AppState())
    }
}
