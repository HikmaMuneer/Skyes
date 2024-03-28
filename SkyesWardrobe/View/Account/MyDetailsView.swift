//
//  MyDetailsView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI
import CountryPicker

struct MyDetailsView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM = MyDetailsViewModel.shared
    
   
    
    var body: some View {
        ZStack {
            
            
            
            ScrollView{
                VStack(spacing: 15){
                    
                    Image("icons8-user-48")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(30)
                        .padding(.bottom, 20)
                
                    
                    LineTextField(title: "Name", placeholder: "Enter your name", txt: $myVM.txtName)
                        .padding(.bottom, 20)
                    
                    
                    VStack {
                        Text("Mobile")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                       
                        HStack{
                                
                            Button {
                                myVM.isShowPicker = true
                                
                            } label: {
                                if let countryObj = myVM.countryObj {
                                    
                                    Text( "\( countryObj.isoCode.getFlag())")
                                        .font(.customfont(.medium, fontSize: 35))
                                                                  
                                    Text( "+\( countryObj.phoneCode )")
                                        .font(.customfont(.medium, fontSize: 18))
                                        .foregroundColor(.primaryText)
                                }
                                
                            }
                            
                            TextField("Enter your mobile number", text:  $myVM.txtMobile)
                                .keyboardType(.numberPad)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            
                        }
                        
                        
                        Divider()
                        
                    }
                    .padding(.bottom, 20)
                    
                    LineTextField(title: "Username", placeholder: "Enter your username" , txt: $myVM.txtUsername)
                        .padding(.bottom, 40)
                    
                                       
                    RoundButton(title: "Update") {
                        myVM.serviceCallUpdate()
                    }
                    .padding(.bottom, 15)
                    
                    NavigationLink {
                        ChangePasswordView()
                    } label: {
                        Text("Change Password")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryApp)
                    }

                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)

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
                    
                    Text( "My Details")
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
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct MyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDetailsView()
    }
}
