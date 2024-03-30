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
                    .frame(width: 60, height: 60)
                
                
                VStack(spacing: 4){
                    
                    HStack {
                        Text(cObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            CartViewModel.shared.serviceCallRemove(cObj: cObj)
                        } label: {
                            Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }
                        
                    }
                    
                    
                    HStack{
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                        } label: {
                            
                            Image( "icons8-minus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                        }
                        .padding(4)
                        
                        
                        Text( "\(cObj.qty)" )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 40, height: 40, alignment: .center)
                        
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                        } label: {
                            
                            Image( "icons8-plus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                        }
                        .padding(4)
                       
                        Spacer()
                        
                        Text("LKR \(cObj.offerPrice ?? cObj.price, specifier: "%.2f" )")
                            .font(.customfont(.semibold, fontSize: 18))
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

