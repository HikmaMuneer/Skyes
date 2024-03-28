//
//  NutritionModel.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct QuantityModel: Identifiable, Equatable {
    
    var id: Int = 0
    var quantityName: String = "";
    var quantityValue: String = "";
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "quantity_id") as? Int ?? 0
        self.quantityName = dict.value(forKey: "prod_name") as? String ?? ""
        self.quantityValue = dict.value(forKey: "quantity") as? String ?? ""
       
    }
    
    static func == (lhs: QuantityModel, rhs: QuantityModel) -> Bool {
        return lhs.id == rhs.id
    }
}
