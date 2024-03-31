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
    @State var width: CGFloat = 120.0
    var didAddCart: (() -> ())?

    var body: some View {
        NavigationLink(destination: ProductDetailView(detailVM:  ProductDetailViewModel(prodObj: pObj))) {
            VStack(spacing: 8) {
                WebImage(url: URL(string: pObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .cornerRadius(8)
                    

                Text(pObj.name)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.primary)

                Text("\(pObj.unitValue)\(pObj.unitName)")
                    .font(.system(size: 10))
                    .foregroundColor(.secondary)

                HStack {
                    Text("LKR \(pObj.offerPrice ?? pObj.price, specifier: "%.2f")")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.primary)

                    Spacer()

                    Button(action: {
                        didAddCart?()
                    }) {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.primary)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.bottom, 10)
                }
            }
            .padding(10)
            .frame(width: width, height: 250)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(pObj: ProductModel(dict: [:])) {}
    }
}
