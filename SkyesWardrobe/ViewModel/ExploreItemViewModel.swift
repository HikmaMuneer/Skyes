//
//  ExploreItemViewModel.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

class ExploreItemViewModel: ObservableObject
{
    @Published var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    @Published var isAscendingOrder = true
    @Published var isImageToggled = false
    
    // New properties for filter
    @Published var minPrice: Double = 0
    @Published var maxPrice: Double = Double.infinity
    
    
    init(catObj: ExploreCategoryModel) {
        self.cObj = catObj
        
        serviceCallList()
    }

    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: ["cat_id": self.cObj.id ], path: Globs.SV_EXPLORE_ITEMS_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.updateProductList(from: response)

//                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
//                        return ProductModel(dict: obj as? NSDictionary ?? [:])
//                    })
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
//    private func updateProductList(from response: NSDictionary) {
//            self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map { obj in
//                return ProductModel(dict: obj as? NSDictionary ?? [:])
//            }
//            sortProducts()
//        }
    
    // Update product list with filtering
    private func updateProductList(from response: NSDictionary) {
        listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map { obj in
            return ProductModel(dict: obj as? NSDictionary ?? [:])
        }
        sortAndFilterProducts()
    }
    
    
    private func sortProducts() {
        self.listArr.sort { product1, product2 in
            let price1 = product1.offerPrice ?? product1.price
            let price2 = product2.offerPrice ?? product2.price
            return isAscendingOrder ? price1 < price2 : price1 > price2
        }
    }
    
//    func toggleSortingOrder() {
//            isAscendingOrder.toggle()
//            sortProducts()
//        }
    
    // Toggle sorting order
    func toggleSortingOrder() {
        isAscendingOrder.toggle()
        sortAndFilterProducts()
    }
    
    private func filterProductsByPrice() {
        listArr = listArr.filter { product in
            let price = product.offerPrice ?? product.price
            return price >= minPrice && price <= maxPrice
        }
    }
        
        
        // Sort and filter products
    private func sortAndFilterProducts() {
        sortProducts()
        filterProductsByPrice()
    }
        
        
        // Set price range and update product list
    func setPriceRange(minPrice: Double, maxPrice: Double) {
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        sortAndFilterProducts()
    }
}
