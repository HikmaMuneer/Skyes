//
//  SizeModel.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-31.
//

import SwiftUI


struct SizeModel: Identifiable, Equatable {
    
    var id: Int = 0
    var prodId: Int = 0
    var sizeName: String = ""

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "size_id") as? Int ?? 0
        self.sizeName = dict.value(forKey: "size_name") as? String ?? ""
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
       
    }
    
    static func == (lhs: SizeModel, rhs: SizeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
