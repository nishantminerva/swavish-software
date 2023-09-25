//
//  RegisterationView.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var currentImage: UIImage!
    
    
    var body: some View {
        VStack {
            
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                ImageView()
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green){
//                        Attempt Registration
                    viewModel.register()
                    
                }
                .padding()
            }
            .offset(y: -50)
            .padding(.top, 250)
        Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
