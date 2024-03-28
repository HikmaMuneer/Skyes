//
//  SignUpView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-19.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        
        ZStack{
            
            Image("SignIn_BG")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView{
                VStack{
                    
                    Image("Logo 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 30))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,4)
                    
                    Text("Create your account")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField(title: "Username", placeholder:"Enter your username", txt: $mainVM.txtUsername)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Email", placeholder:"Enter your email address", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField(title: "Password", placeholder:"Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.04)
                    
                    Text("By continuing you agreee to our")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                    
                    VStack{
                        HStack{
                            
                            Text("Terms of Service")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(Color(hex: "E9A598"))
                            
                            Text(" and ")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("Privacy Policy")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(Color(hex: "E9A598"))
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                                
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    
                    
                    
                    RoundButton(title: "Sign Up"){
                        mainVM.serviceCallSignUp()
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    NavigationLink{
                        LoginView()
                        
                    } label: {
                        HStack{
                            Text("Already have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Sign In")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(Color(hex: "E9A598"))
                        }
                    }
                    
                    
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
            VStack{
                
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("icons8-back-50")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                
                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName) ,message: Text(mainVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()

    }
}

//#Preview {
//    SignUpView()
//}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
