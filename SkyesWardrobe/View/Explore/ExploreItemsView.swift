//
//  ExploreItemsView.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI


struct ExploreItemsView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel (dict: [:]))
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 100000 
    @State private var isFiltering = false
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
        
    ]
    
    var body: some View {
        ZStack{
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
                    
                    
                    Text( itemsVM.cObj.name )
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        

                    Button(action: {
                        itemsVM.toggleSortingOrder()
                        itemsVM.isImageToggled.toggle()
                    }) {
                        Image(itemsVM.isImageToggled ? "icons8-sort-60" : "icons8-sort-64")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }

                }
                
                ScrollView {
                    LazyVGrid(columns: columns,  spacing:15) {
                         
                        ForEach(itemsVM.listArr, id: \.id) {
                            pObj in
                            ProductCell( pObj: pObj, width: .infinity ) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.itemsVM.errorMessage = msg
                                    self.itemsVM.showError = true
                                }
                            }
                            
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
                Button(action: {
                                isFiltering.toggle()
                            }) {
                                Image(systemName: "line.horizontal.3.decrease.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
                            .offset(y: -20)
                
                if isFiltering {
                    VStack {
                        Text("Price Range")
                            .font(.customfont(.bold, fontSize: 20))
                            .padding()

                        
                        Slider(value: $minPrice, in: 0...100000, step: 50)
                            .padding(.horizontal)
                            
                                               
                        Text("Min: LKR \(minPrice, specifier: "%.2f")")
                                                   .padding(.horizontal)
                                               
                        Slider(value: $maxPrice, in: 0...100000, step: 50)
                                                   .padding(.horizontal)
                                               
                        Text("Max: LKR \(maxPrice, specifier: "%.2f")")
                                                   .padding(.horizontal)
                        
                        Divider()
                            .background(Color.black)
                            .frame(height: 1)
                        
                        Button("Apply Filters") {
                            // Apply filters
                            itemsVM.setPriceRange(minPrice: minPrice, maxPrice: maxPrice)
                            isFiltering = false
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
            
        }
        .alert(isPresented: $itemsVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}


struct ExploreItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [:
             
            ] ) ))
        }
        
    }
}
