//
//  OTPView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct OTPView: View {
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
                
                Text("Forgot Password")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 70)
                
                Text("Enter your 4-digit code")
                    .font(.customfont(.semibold, fontSize: 20))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
                
                
                
                LineTextField( title: "Code", placeholder: "- - - -", txt: $forgotVM.txtResetCode, keyboardType: .phonePad)
                    .padding(.bottom, .screenWidth * 0.07)
                
                
                HStack {
                    Button {
                        forgotVM.serviceCallRequest()
                    } label: {
                        Text("Resend Code")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.blue)
                            
                    }
                    
                    Spacer()
                    
                    Button {
                        forgotVM.serviceCallVerify()
                    } label: {
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(15)
                    }
                    .foregroundColor(.white)
                    .background(Color.primaryApp)
                    .cornerRadius(30)
                    
                }
                
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
                
            Alert(title: Text(Globs.AppName), message: Text( forgotVM.errorMessage ), dismissButton: .default(Text("OK")))
        }
       
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}

//#Preview {
//    OTPView()
//}
