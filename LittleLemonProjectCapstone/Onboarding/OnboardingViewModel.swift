//
//  OnboardingViewModel.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 16.10.24.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    private var kFirstName = "First Name"
    private var kLastName = "Last Name"
    private var kEmail = "Email"
    let kIsLoggedIn = "kIsLoggedIn"
    
    /// Register User
    func registerUser() {
        if !firstName.isEmpty || !lastName.isEmpty || !email.isEmpty {
            if isEmailValid(email) {
                UserDefaults.standard.set(firstName, forKey: kFirstName)
                UserDefaults.standard.set(lastName, forKey: kLastName)
                UserDefaults.standard.set(email, forKey: kEmail)
                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                print("User registered successfully")
            } else {
                alertMessage = "Email is not valid"
                showAlert = true
            }
        } else {
            alertMessage = "Fields cannot be empty"
            showAlert = true
        }
    }
    
    /// Loging User
    func loginUser() {
        isLoading = true
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
            if isEmailValid(email) {
                isLoggedIn = true
                registerUser()
            } else {
                alertMessage = "Please enter a valid email address"
                showAlert = true
            }
        } else {
            isLoading = false
            alertMessage = "Fields cannot be empty"
            showAlert = true
        }
    }
    
    /// Email Validation
    func isEmailValid(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}
