//
//  MainTabView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-19.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack{
            
            VStack{
//                Spacer()
                
                HStack{
                    Button {
                        MainViewModel.shared.isUserLogin = false
                    } label: {
                        Text("Logout")
                    }

                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
