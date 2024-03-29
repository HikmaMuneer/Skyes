//
//  ProductDetailView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    let colors: [Color] = [.black, .gray, Color(hex: "FFC5BB"), Color(hex: "C3E1EB"), Color(hex: "7AB485")] // Example colors
    let sizes = ["UK 4", "UK 6", "UK 8", "UK 10"]
    @State private var selectedColor: Color?
    @State private var selectedSize: String?

    
    var body: some View {
        ZStack{
            
            ScrollView {
                ZStack{
                      Rectangle()
                        .foregroundColor( Color(hex: "F2F2F2") )
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                    
                    WebImage(url: URL(string: detailVM.pObj.image ))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                }
//                .frame(width: .screenWidth, height: .screenWidth * 0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .foregroundColor(.clear)
                        .border(Color.clear, width: 0)
                        .padding(.bottom, 0)
                )
                
                VStack{
                    HStack{
                        Text(detailVM.pObj.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favorite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)

                    }
//                    Text("\(detailVM.pObj.unitValue)\(detailVM.pObj.unitName), Price")
//                        .font(.customfont(.semibold, fontSize: 16))
//                        .foregroundColor(.secondaryText)
//                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        } label: {
                            
                            Image( "icons8-minus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                        }
                        
                        Text( "\(detailVM.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        } label: {
                            
                            Image( "icons8-plus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                        }
                        
                        Spacer()
                        Text( "LKR \(  (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f")"  )
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                            
                    }
                    .padding(.vertical, 8)
                    
                    Divider()
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                
                
                VStack{
                    HStack{
                        Text("Product Details")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowDetail ? "detail_open" : "icons8-next-50"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.pObj.detail)
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                

                VStack {
                            HStack {
                                Text("Size")
                                    .font(.customfont(.semibold, fontSize: 16))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(detailVM.pObj.nutritionWeight)
                                    .font(.customfont(.semibold, fontSize: 10))
                                    .foregroundColor(.secondaryText)
                                    .padding(8)
                                    .background( Color.placeholder.opacity(0.5) )
                                    .cornerRadius(5)
                                
                                Button {
                                    withAnimation {
                                        detailVM.showQuantity()
                                    }
                                } label: {
                                    Image( detailVM.isShowQuantity ? "detail_open" : "icons8-next-50"  )
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .padding(15)
                                }
                                .foregroundColor(Color.primaryText)
                            }
                            .padding(.horizontal, 20)
                            
                            if detailVM.isShowQuantity {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(sizes, id: \.self) { size in
                                            Button(action: {
                                                // Action when size button is tapped
                                                selectedSize = size
                                            }) {
                                                Text(size)
                                                    .font(.customfont(.semibold, fontSize: 15))
                                                    .foregroundColor(.primaryText)
                                                    .padding(.horizontal, 15)
                                                    .padding(.vertical, 8)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .fill(selectedSize == size ? Color.secondaryText.opacity(0.5) : Color.secondaryText.opacity(0.2))
                                                    )
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                    .padding(.horizontal, 10)
                                }
                            }
                            
                            Divider()
                        }
                        .padding(.horizontal, 20)
                
                

                VStack {
                            Text("Colors")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 10) {
                                ForEach(colors, id: \.self) { color in
                                    Button(action: {
                                        selectedColor = color
                                    }) {
                                        Circle()
                                            .fill(color)
                                            .frame(width: 20, height: 20)
                                            .overlay(
                                                Circle().stroke(Color.white, lineWidth: selectedColor == color ? 2 : 0)
                                            )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                            }
                        }
                   

                }
                .padding(.horizontal, 20)
                
                RoundButton(title: "Add To Basket") {
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                }
                .padding( 20)
                
            }
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("icons8-back-50")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("OK"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
            
                "offer_price": 2.49,
                "start_date": "2023-07-30T18:30:00.000Z",
                "end_date": "2023-08-29T18:30:00.000Z",
                "prod_id": 5,
                "cat_id": 1,
                "brand_id": 1,
                "type_id": 1,
                "name": "Ripped Jeans",
                "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
                "unit_name": "pcs",
                "unit_value": "7",
                "nutrition_weight": "200g",
                "price": 2.99,
                "image": "http://192.168.1.3:3001/img/product/202307310947354735xuruflIucc.png",
                "cat_name": "Frash Fruits & Vegetable",
                "type_name": "Pulses",
                "is_fav": 1
            
        ])))
    }
}
