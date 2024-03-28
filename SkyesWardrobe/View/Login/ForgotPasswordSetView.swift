//
//  ForgotPasswordSetView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct ForgotPasswordSetView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var forgotVM = ForgotPasswordViewModel.shared;
    
    
    var body: some View {
        ZStack {
            Image("SignIn_BG")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            
            VStack{
                
                Image("Logo 2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Set new password")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 60)
                
//                Text("Enter your new password")
//                    .font(.customfont(.semibold, fontSize: 16))
//                    .foregroundColor(.secondaryText)
//                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                    .padding(.bottom, .screenWidth * 0.1)
                
                
                LineSecureField( title: "New Password", placeholder: "Enter your new password", txt: $forgotVM.txtNewPassword, isShowPassword: $forgotVM.isNewPassword)
                    .padding(.bottom, .screenWidth * 0.08)
                
                LineSecureField( title: "Confirm Password", placeholder: "Enter your confirm password", txt: $forgotVM.txtConfirmPassword, isShowPassword: $forgotVM.isConfirmPassword)
                    .padding(.bottom, .screenWidth * 0.39)
                
                
                RoundButton(title: "Submit") {
                    forgotVM.serviceCallSetPassword()
                }
//                .padding(.bottom, .screenWidth * 0.05)
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            
            VStack {
                    
                HStack {
                    Button {
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
        .alert(isPresented: $forgotVM.showError) {
                
            Alert(title: Text(Globs.AppName), message: Text( forgotVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct ForgotPasswordSetView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordSetView()
    }
}

//#Preview {
//    ForgotPasswordSetView()
//}
