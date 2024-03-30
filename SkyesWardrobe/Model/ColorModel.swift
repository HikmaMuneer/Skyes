//
//  ColorsModel.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-30.
//

import SwiftUI

struct ColorModel: Identifiable, Equatable {
    var id: Int = 0
    var colorName: String = ""
    var colorValue: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "color_id") as? Int ?? 0
        self.colorName = dict.value(forKey: "color_name") as? String ?? ""
        self.colorValue = dict.value(forKey: "color_value") as? String ?? ""
    }
    
    static func == (lhs: ColorModel, rhs: ColorModel) -> Bool {
        return lhs.id == rhs.id
    }
}
