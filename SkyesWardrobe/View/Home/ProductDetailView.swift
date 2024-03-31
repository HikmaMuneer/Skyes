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
    @State private var selectedColor: String?
    @State private var selectedSize: String?
   
    
    var body: some View {
        ZStack{
            
            ScrollView {
                Rectangle()
                    .foregroundColor(.white )
                    .frame(width: .screenWidth, height: .screenWidth * 0.25)
                ZStack{
                    
                    WebImage(url: URL(string: detailVM.pObj.image ))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                }
                
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
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favorite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .foregroundColor(Color.secondaryText)
                        
                    }
                    
                    
                    HStack{
                        
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        } label: {
                            
                            Image( "icons8-minus-48"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(5)
                        }
                        
                        Text( "\(detailVM.qty)" )
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 30, height: 30, alignment: .center)
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
                                .frame(width: 20, height: 20)
                                .padding(5)
                        }
                        
                        Spacer()
                        Text( "LKR \(  (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f")"  )
                            .font(.customfont(.bold, fontSize: 16))
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
                            .font(.customfont(.semibold, fontSize: 14))
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
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        Button {
                            withAnimation {
                                detailVM.showSize()
                            }
                        } label: {
                            Image( detailVM.isShowSize ? "detail_open" : "icons8-next-50"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    
                    if detailVM.isShowSize {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(detailVM.sizeArr, id: \.self) { size in
                                    Button(action: {
                                        selectedSize = size
                                    }) {
                                        Text(size)
                                            .font(.customfont(.semibold, fontSize: 10))
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 8)
                                            .background(selectedSize == size ? Color(hex: "FFC5BB") : Color.gray.opacity(0.5))
                                            .foregroundColor(selectedSize == size ? .black : .white)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                    
                                }
                            }
                        }
                        .onAppear {
                            selectedSize = detailVM.sizeArr.first
                        }
                    }
                    Divider()
                }
                .padding(.horizontal, 20)
                
                
                
                VStack {
                    
                    HStack(spacing: 10) {
                        
                        Text("Colors")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            withAnimation {
                                detailVM.showColor()
                            }
                        } label: {
                            Image( detailVM.isShowColor ? "detail_open" : "icons8-next-50"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                        
                    }
                    .padding(.top, 6)
                    
                    //----------
                    if detailVM.isShowColor {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(detailVM.colorArr, id: \.self) { color in
                                    Button(action: {
                                        selectedColor = color
                                    }) {
                                        Circle()
                                            .foregroundColor(Color(hex: color))
                                            .frame(width: 15, height: 15)
                                            .overlay(
                                                Circle()
                                                    .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 3)
                                            )
                                        
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.top, 10)
                                    .padding(.bottom, 8)
                                }
                                
                                
                            }
                            .padding(.horizontal, 8)
                        }
                        .onAppear {
                            // Set the initial selected color and size to the first elements of their respective arrays
                            selectedColor = detailVM.colorArr.first
                        }
                    }
                }
               
                .padding(.horizontal, 20)
                    
                    //----------
                    
                
                RoundButton(title: "Add To Basket") {
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty, color: selectedColor ?? "000000", size: selectedSize ?? "UK 4" ) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                }
                .padding( 20)
                .padding(.top, 15)
                
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
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("OK"))  )
        })
        .onAppear {
            // Set the initial selected color and size to the first elements of their respective arrays
            selectedColor = detailVM.colorArr.first
            selectedSize = detailVM.sizeArr.first
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }

}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [:
            
        ])))
    }
}

