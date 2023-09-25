//
//  LoginViewViewModel.swift
//  Swavish Software
//
//  Created by Nishant Minerva on 24/09/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
//        Try Login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
//    Checking empty field and correction
    private func validate() -> Bool {

                errorMessage = ""
        //        Checking does they are empty before logining
        //        To remove space at the ends if user accidently press at the end or start
                guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                    
                    errorMessage = "Please fill in all field"
                    
                    return false
                }
        //        email@foo.com
                guard email.contains("@") && email.contains(".") else {
                    errorMessage = "Please enter valid email"
                    return false
                }
                
        return true
    }
}
