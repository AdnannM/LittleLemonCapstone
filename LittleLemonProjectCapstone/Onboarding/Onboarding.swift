//
//  Onboarding.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 16.10.24.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var isLoading: Bool = false
    @State private var isLoggedIn: Bool = false
    
    @StateObject private var vm = OnboardingViewModel()
    
    var body: some View {
        
        NavigationStack {
            LittleLemonLogo()
                .padding(.top, 50)
            
            Text("Registration")
                .styledText()
            
            VStack(spacing: 12) {
                CustomTextField(text: $vm.firstName, placeholder: "First name")
                CustomTextField(text: $vm.lastName, placeholder: "Last name")
                CustomTextField(text: $vm.email, placeholder: "Email")
            }
            .padding()
            .padding(.top, 70)
            
            Button {
                registerUser()
                isLoading = false
            } label: {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Register")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.primary1)
            .foregroundStyle(Color.primary2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Error"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: vm.kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            
            Spacer()
        }
    }
    
    // MARK: - Register User
    fileprivate func registerUser() {
        isLoading = true
        if !vm.firstName.isEmpty && !vm.lastName.isEmpty && !vm.email.isEmpty {
            if vm.isEmailValid(vm.email) {
                isLoggedIn = true
                vm.registerUser()
            } else {
                vm.alertMessage = "Please enter a valid email address"
                vm.showAlert = true
            }
        } else {
            isLoading = false
            vm.alertMessage = "Fields cannot be empty"
            vm.showAlert = true
        }
    }
}

#Preview {
    Onboarding()
}

