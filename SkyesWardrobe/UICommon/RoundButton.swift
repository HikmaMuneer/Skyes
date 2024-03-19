//
//  RoundButton.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-17.
//

import SwiftUI

struct RoundButton: View {
    @State var title : String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button{
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight:60, maxHeight:60)
        .background(Color.primaryApp)
        .cornerRadius(20)    }
}

#Preview {
    RoundButton()
        .padding(20)
}
