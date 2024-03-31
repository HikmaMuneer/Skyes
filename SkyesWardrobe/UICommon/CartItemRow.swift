//
//  CartItemRow.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                WebImage(url: URL(string: cObj.image ))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                
                VStack(spacing: 4){
                    
                    HStack {
                        Text(cObj.name)
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            CartViewModel.shared.serviceCallRemove(cObj: cObj)
                        } label: {
                            Image("close")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        
                    }
                    
                    HStack {
                        
                        Text("Color : ")
                            .font(.customfont(.semibold, fontSize: 12))
                            .foregroundColor(.secondaryText)
                        
                        if !cObj.userColor.isEmpty {
                            Circle()
                                .foregroundColor(Color(hex: cObj.userColor))
                                .frame(width: 15, height: 15)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black , lineWidth: 3)
                                )
                        }
                        Spacer()
                    }
                                        
                    HStack {
                        Text("Size : \(cObj.size ?? "")")
                            .font(.customfont(.semibold, fontSize: 12))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                    }
                    
                    
                    HStack{
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                        } label: {
                            
                            Image( "icons8-minus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(5)
                        }
                        .padding(4)
                        
                        
                        Text( "\(cObj.qty)" )
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 25, height: 25, alignment: .center)
                        
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                        } label: {
                            
                            Image( "icons8-plus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(5)
                        }
                       
                        Spacer()
                        
                        Text("Each LKR \(cObj.offerPrice ?? cObj.price, specifier: "%.2f" )")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                    }
                    
                }
                
            }
            Divider()
        }
    }
}

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CartItemRow(cObj: CartItemModel(dict: [:
            
                   ]))
        .padding(.horizontal, 20)
    }
}

