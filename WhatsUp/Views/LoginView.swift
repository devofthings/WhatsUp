//
//  LoginView.swift
//  WhatsUp
//
//  Created by Christopher Winter on 25.08.23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var appState: AppState
    
    @EnvironmentObject private var model: Model
    
    private var isFormValid: Bool {
        // TODO: Add RegEx for email field
        !email.isEmptyOrWhitespace && !password.isEmptyOrWhitespace
    }
    
    private func login() async {
        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            appState.routes.append(.main)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email).textInputAutocapitalization(.never).keyboardType(.emailAddress)
            SecureField("Password", text: $password).textInputAutocapitalization(.never)
            
            HStack {
                Spacer()
                Button("Login") {
                    Task {
                        await login()
                    }
                }.disabled(!isFormValid)
                Button("Register"){
                    appState.routes.append(.register)
                }.buttonStyle(.borderless)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AppState())
    }
}
