//
//  LoginView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-17.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            
            Image("SignIn_BG")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                
                Image("Logo 2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Log In")
                    .font(.customfont(.semibold, fontSize: 30))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,4)
                
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.12)
                
                
                LineTextField(title: "Email", placeholder:"Enter your email address", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureField(title: "Password", placeholder:"Enter your password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                Button{
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.blue)
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.07)
                
                RoundButton(title: "Log In"){
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom, .screenWidth * 0.03)
                
                NavigationLink{
                    SignUpView()
                    
                } label: {
                    HStack{
                        Text("Don't have an account")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Sign Up")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(Color(hex: "E9A598"))
                    }
                }
                
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)

            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("icons8-back-50")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
            
        }
        .alert(isPresented: $loginVM.showError){
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

//#Preview {
//    NavigationView{
//        LoginView()
//    }
//}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            LoginView()
        }
        
    }
}
