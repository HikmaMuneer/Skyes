//
//  ProductCell.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width: Double = 150.0
    var didAddCart: ( ()->() )?
    
    
    var body: some View {
        NavigationLink {
            ProductDetailView(detailVM:  ProductDetailViewModel(prodObj: pObj) )
        } label: {
            VStack{
                
                WebImage(url: URL(string: pObj.image ))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 12))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text("\(pObj.unitValue)\(pObj.unitName)")
                    .font(.customfont(.medium, fontSize: 10))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack{
                    Text("LKR \(pObj.offerPrice ?? pObj.price, specifier: "%.2f" )")
                        .font(.customfont(.semibold, fontSize: 10))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        
                        didAddCart?()
                    } label: {
                        Image("icons8-plus-48")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .frame(width: 40, height: 40)
//                    .background( Color.primaryApp)
                    .cornerRadius(15)
                    
                    
                }
                
            }
            .padding(15)
            .frame(width: width, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
            )
        }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(pObj: ProductModel(dict: [:])) {
            
        }
    }
}
