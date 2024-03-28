//
//  AddDeliveryAddressView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    @State var editObj: AddressModel?
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                    HStack{
                        
                        Button {
                            addressVM.txtTypeName = "Home"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Home" ? "record.circle" : "circle"  )
                                
                            Text("Home")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundColor(.primaryText)
                        
                        
                        Button {
                            addressVM.txtTypeName = "Office"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Office" ? "record.circle" : "circle"  )
                                
                            Text("Office")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                        }
                        .foregroundColor(.primaryText)

                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    
                    LineTextField(title: "Name", placeholder: "Enter your name" , txt: $addressVM.txtName)
                        .padding(.bottom, 10)
                    
                    LineTextField(title: "Mobile", placeholder: "Enter your mobile number", txt: $addressVM.txtMobile, keyboardType: .numberPad)
                        .padding(.bottom, 10)
                    
                    LineTextField(title: "Address Line", placeholder: "Enter your address" , txt: $addressVM.txtAddress)
                        .padding(.bottom, 10)
                    
                    HStack{
                        LineTextField(title: "City", placeholder: "Enter your city" , txt: $addressVM.txtCity)
                            .padding(.bottom, 10)
                        LineTextField(title: "State", placeholder: "Enter your state" , txt: $addressVM.txtState)
                            .padding(.bottom, 10)
                    }
                   
                    
                    LineTextField(title: "Postal Code", placeholder: "Enter your postal code" , txt: $addressVM.txtPostalCode)
                        .padding(.bottom, 40)
                    
                    RoundButton(title: isEdit ? "Update Address" : "Add Address") {
                        if(isEdit) {
                            addressVM.serviceCallUpdateAddress(aObj: editObj) {
                                self.mode.wrappedValue.dismiss()
                            }
                        }else{
                            addressVM.serviceCallAddAddress {
                                self.mode.wrappedValue.dismiss()
                            }
                        }
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
                    
                    Text( isEdit ? "Edit Delivery Address" : "Add Delivery Address")
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
        .onAppear{
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(aObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(addressVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct AddDeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeliveryAddressView()
    }
}
