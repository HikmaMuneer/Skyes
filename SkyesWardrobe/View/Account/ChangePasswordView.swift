//
//  ChangePasswordView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM = MyDetailsViewModel.shared
    
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                    Image("icons8-one-time-password-100")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(30)
                        .padding(.bottom, 50)
                    
                    
                    LineSecureField( title: "Current Password", placeholder: "Enter your current password", txt: $myVM.txtCurrentPassword, isShowPassword: $myVM.isCurrentPassword)
                        .padding(.bottom, .screenWidth * 0.05)
                    
                    LineSecureField( title: "New Password", placeholder: "Enter your new password", txt: $myVM.txtNewPassword, isShowPassword: $myVM.isNewPassword)
                        .padding(.bottom, .screenWidth * 0.05)
                    
                    LineSecureField( title: "Confirm Password", placeholder: "Enter your confirm password", txt: $myVM.txtConfirmPassword, isShowPassword: $myVM.isConfirmPassword)
                        .padding(.bottom, .screenWidth * 0.15)
                    
                    RoundButton(title: "Update") {
                        myVM.serviceCallChangePassword()
                    }
                    
                    RoundButton(title: "Cancel") {
                        
                    }

                    
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 60)

            }
            
            VStack {
                    
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("icons8-back-50")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    Text( "Change Password")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
        }
        
        .sheet(isPresented: $myVM.isShowPicker, content: {
            CountryPickerUI(country: $myVM.countryObj)
        })
        .alert(isPresented: $myVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
