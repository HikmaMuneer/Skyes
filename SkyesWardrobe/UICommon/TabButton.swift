//
//  TabButton.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "icons8-store-60"
    var isSelect: Bool = false
    var didSelect: (()->())
    
    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                
                
            }
        }
        .foregroundColor(isSelect ? Color(hex: "FFC5BB") : .primaryText )
        .frame(minWidth: 0, maxWidth: .infinity)
        
    }
}



#Preview {
    TabButton{
        print("Test")
    }
}
