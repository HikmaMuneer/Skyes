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
//        .background(
//                    ZStack {
//                        if isSelect {
//                            RoundedRectangle(cornerRadius: 5)
//                                .fill(Color(hex: "FFC5BB"))
//                        } else {
//                            Color.clear // Placeholder for background color when not selected
//                        }
//                    }
//                )
    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton {
//            print("Test")
//        }
//    }
//}


#Preview {
    TabButton{
        print("Test")
    }
}
