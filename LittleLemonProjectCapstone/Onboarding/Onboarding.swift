//
//  Onboarding.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 16.10.24.
//

import SwiftUI

struct Onboarding: View {
    
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
                vm.loginUser()
                vm.isLoading = false
            } label: {
                if vm.isLoading {
                    ProgressView()
                } else {
                    Text("Register")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.primary1)
                        .foregroundStyle(Color.primary2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                }
            }
            .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Error"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: $vm.isLoggedIn) {
                Home()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: vm.kIsLoggedIn) {
                    vm.isLoggedIn = true
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    Onboarding()
}

