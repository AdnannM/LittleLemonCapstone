//
//  UserProfile.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

struct UserProfile: View {
    
    @StateObject private var vm = UserProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            UserProfileHeader()
            
            Text("Personal Information")
                .styledText()
            
            Form {
                Section(header: Text("User Profile")) {
                    Text(vm.firstName)
                    Text(vm.lastName)
                    Text(vm.email)
                }
                
                Section(header: Text("User Settings")) {
                    Toggle("Allow Notification", isOn: $vm.allowNotification)
                        .onChange(of: vm.allowNotification) {
                            vm.requestNotificationPermission()
                        }
                    Toggle("Dark & Light Mode", isOn: $vm.darkLightMode)
                }
//                .preferredColorScheme(vm.darkLightMode ? .dark : .light)
            }
            .background(.orange)
            .frame(maxHeight: 360)
            .cornerRadius(10)
            
            .padding(.top, 20)
            
            Button {
                vm.logoutUser()
                dismiss()
            } label: {
                Text("Logout")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.primary1)
                    .foregroundStyle(Color.primary2)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserProfile()
}

