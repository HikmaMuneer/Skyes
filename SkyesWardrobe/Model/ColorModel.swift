//
//  ColorModel.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-31.
//

import SwiftUI

struct ColorModel: Identifiable, Equatable {
    
    var id: Int = 0
    var prodId: Int = 0
    var color: String = ""

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "color_id") as? Int ?? 0
        self.color = dict.value(forKey: "color_value") as? String ?? ""
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
       
    }
    
    static func == (lhs: ColorModel, rhs: ColorModel) -> Bool {
        return lhs.id == rhs.id
    }
}

