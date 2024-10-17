//
//  UserProfileViewModel.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import Foundation
import UserNotifications

class UserProfileViewModel: ObservableObject {
    
    @Published  var allowNotification: Bool = false
    @Published  var darkLightMode: Bool = false
    
    @Published  var firstName: String = UserDefaults.standard.string(forKey: "First Name") ?? "First Name"
    @Published  var lastName: String = UserDefaults.standard.string(forKey: "Last Name") ?? "Last Name"
    @Published  var email: String = UserDefaults.standard.string(forKey: "Email") ?? "Email"
    
    func logoutUser() {
        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }

}
