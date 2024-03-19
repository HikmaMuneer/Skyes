//
//  WelcomeView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-17.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("First_BG")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth,height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("Logo 2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 160)
                
                Text("Welcome\nto Skye's")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("Get in with the trends")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started"){
                        
                    }
                }

                
                Spacer()
                    .frame(height: 60)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)  
        .ignoresSafeArea()
    }
        
}


#Preview {
    NavigationView{
        WelcomeView()
    }
}
