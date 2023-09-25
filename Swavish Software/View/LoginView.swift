//
//  LoginView.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//            Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address" , text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(title: "Login", background: .blue) {
//                        Attempt Login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
    //            Create Account
                VStack {
                    Text("New Around here?")
                    NavigationLink("Create An Account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                
//                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
