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
                        
                    
//                    Button {
//                    } label: {
//                        Image("filter")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                    }
                    
                    
                    //---------------------------------------------
                    Button(action: {
                        itemsVM.toggleSortingOrder() 
                    }) {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    //---------------------------------------------

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
            ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
                "cat_id": 1,
                "cat_name": "Denims",
                "image": "http://192.168.1.3:3001/img/category/20230726155407547qM5gSxkrCh.png",
                "color": "53B175"
            ] ) ))
        }
        
    }
}
