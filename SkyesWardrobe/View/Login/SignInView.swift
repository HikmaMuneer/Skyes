//
//  SignInView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-17.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {

        ZStack{
            
            Image("First_BG")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
                        
            ScrollView{
                
                VStack{
                    
                    Image("Logo 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170, height: 170)
                        .padding(.bottom, 10)
                    
                    Text("Get in line with \nthe trends")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 90)
                    

                    NavigationLink{
                        LoginView()
                    } label: {
                        Text("  Login")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    
                    NavigationLink{
                        SignUpView()
                    } label: {
                        Text("  New User? Sign Up")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    Divider()
                        .padding(.bottom, 25)
                                   
                }
                .padding(.horizontal,20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.5)
                
                
            }
            
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

