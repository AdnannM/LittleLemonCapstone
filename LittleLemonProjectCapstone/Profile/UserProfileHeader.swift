//
//  UserProfileHeader.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

struct UserProfileHeader: View {
    
    var body: some View {
        HStack {
            Image("profilePicture")
                .resizable()
                .frame(width: 130, height: 130)
                .padding()
            
            VStack(spacing: 10) {
                Button {
                    print("Chnage Picture Button Tapped")
                } label: {
                    Text("Change Picture")
                        .foregroundStyle(Color.primary2)
                }
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 8)
                .background(.primary1)
                .clipShape(.capsule)
                
                Button {
                    print("EditButton Button Tapped")
                } label: {
                    Text("Edit Profile")
                        .foregroundStyle(Color.primary1)
                }
                .padding([.leading, .trailing], 37)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .clipShape(.capsule)
            }
            
            .padding(.leading, 40)
        }
    }
}


#Preview {
    UserProfileHeader()
}
