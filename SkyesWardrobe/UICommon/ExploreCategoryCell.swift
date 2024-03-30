//
//  ExploreCategoryCell.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

//import SwiftUI
//
//struct ExploreCategoryCell: View {
//    var body: some View {
//
//    }
//}
//
//#Preview {
//    ExploreCategoryCell()
//}

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [ : ])
   
   
    
    var body: some View {
        VStack{
            
            WebImage(url: URL(string: cObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 50, height: 50)
            
        
            Spacer()
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 12))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
        }
        .padding(10)
        .background( cObj.color.opacity(0.3) )
        .cornerRadius(16)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(cObj.color, lineWidth: 1)
        )
    }}

struct ExploreCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCategoryCell(cObj: ExploreCategoryModel(dict: [ "cat_id": 1,
                                                               "cat_name": "Womens",
                                                               "image": "http://localhost:3001/app/img/category/202403290438143814cVlTMVZOt1.png",
                                                               "color": "F8A44C"]) )
        .padding(10)
    }
}

