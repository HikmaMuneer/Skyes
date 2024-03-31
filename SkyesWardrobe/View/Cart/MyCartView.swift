//
//  MyCartView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct MyCartView: View {
    @StateObject var cartVM = CartViewModel.shared
    
    var body: some View {
        ZStack{
            
            if(cartVM.listArr.count == 0) {
                Text("Your Cart is Empty")
                    .font(.customfont(.bold, fontSize: 18))
            }
            
            ScrollView{
                LazyVStack {
                    ForEach( cartVM.listArr , id: \.id, content: {
                        cObj in
                        
                        CartItemRow(cObj: cObj)
                        
                    })
                    .padding(.vertical, 8)
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
                
            }
            
            
            VStack {
                
                HStack{
                    
                    Spacer()
                    
                    Text("My Cart")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
                HStack(spacing: 15) {

                    VStack(spacing: 6){
                        Text("Total : LKR \(cartVM.total)")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        if(cartVM.listArr.count > 0) {
                            Button {
                                cartVM.showCheckout = true
                            } label: {
                                ZStack {
                                    
                                    Text("Go to Check Out")
                                        .font(.customfont(.semibold, fontSize: 14))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                    
                                    
                                }
                                
                            }
                            .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                            .background( Color.primaryApp)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.bottom, .bottomInsets + 80)
                            
                            
                        }
                        
                    }
                }
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)

                
                
                
            }
            if(cartVM.showCheckout) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            cartVM.showCheckout = false
                        }
                    }
                
                CheckoutView(isShow: $cartVM.showCheckout )
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .onAppear{
            cartVM.serviceCallList()
        }
        .background( NavigationLink(destination: OrderAccpetView(), isActive: $cartVM.showOrderAccept  , label: {
            EmptyView()
        }) )
        .alert(isPresented: $cartVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .animation(.easeInOut, value: cartVM.showCheckout)
        .ignoresSafeArea()
        
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyCartView()
        }
        
    }
}
