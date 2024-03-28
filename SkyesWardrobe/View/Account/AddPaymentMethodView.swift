//
//  AddPaymentMethodView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                                        
                    LineTextField(title: "Name", placeholder: "Enter your name" , txt: $payVM.txtName)
                        .padding(.bottom, 20)
                    
                    LineTextField(title: "Card Number", placeholder: "Enter card number", txt: $payVM.txtCardNumber, keyboardType: .numberPad)
                        .padding(.bottom, 20)
                    
                   
                    
                    HStack{
                        LineTextField(title: "MM", placeholder: "Enter Month" , txt: $payVM.txtCardMonth, keyboardType: .numberPad)
                        LineTextField(title: "YYYY", placeholder: "Enter Year" , txt: $payVM.txtCardYear, keyboardType: .numberPad)
                    }
                    .padding(.bottom, 35)
                   
                    
                    RoundButton(title:  "Add Card") {
                        
                            payVM.serviceCallAdd {
                                self.mode.wrappedValue.dismiss()
                            }
                        
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 75)

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
                    
                    Text("Add Payment Method")
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
        
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct AddPaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentMethodView()
    }
}
