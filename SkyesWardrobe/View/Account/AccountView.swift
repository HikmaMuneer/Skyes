//
//  AccountView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            VStack{
                
                HStack(spacing: 15) {
                    Image("icons8-user-48")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                    
                    VStack{
                        
                        HStack{
                            Text("Hikma Muneer")
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        Text("hikma@gmail.com")
                            .font(.customfont(.regular, fontSize: 16))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                            .accentColor(.secondaryText)
                                                    
                    }
                }
                .padding(.bottom)
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Divider()
                
                ScrollView {
                    LazyVStack {
                        
                        VStack{
                            
                            NavigationLink {
                                MyOrdersView()
                            } label: {
                                AccountRow(title: "My Orders", icon: "a_order")
                            }
                            
                            NavigationLink {
                                MyDetailsView()
                            } label: {
                                AccountRow(title: "My Details", icon: "a_my_detail")
                            }
                                                        
                            NavigationLink {
                                DelieryAddressView()
                            } label: {
                                AccountRow(title: "Delivery Address", icon: "a_delivery_address")
                            }
                            
                            NavigationLink {
                                PaymentMethodsView()
                            } label: {
                                AccountRow(title: "Payment Methods", icon: "paymenth_methods")
                            }

                            NavigationLink {
                                PromoCodeView()
                            } label: {
                                AccountRow(title: "Promo Code", icon: "a_promocode")
                            }
                            
                        }
                        
                        VStack{
                            NavigationLink {
                                NotificationView()
                            } label: {
                                AccountRow(title: "Notifications", icon: "a_noitification")
                            }
                           
                            AccountRow(title: "Help", icon: "a_help")
                            AccountRow(title: "About", icon: "a_about")
                        }
                        
                        Button {
                            MainViewModel.shared.logout()
                        } label: {
                            ZStack {
                                Text("Log Out")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Spacer()
                                    Image("icons8-logout-48")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 20)
                                }
                            }
                           
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background( Color(hex: "F2F3F2"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        
                    }
                    
                }
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AccountView()
        }
        
    }
}
