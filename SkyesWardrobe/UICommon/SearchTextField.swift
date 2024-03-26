//
//  SearchTextField.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-27.
//

import SwiftUI

struct SearchTextField: View {
    
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image("icons8-search-50")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
           
            TextField(placholder, text: $txt)
                .font(.customfont(.regular, fontSize: 17))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}

//#Preview {
//    @State static var txt: String = ""
//    SearchTextField(placholder: "Search Products", txt: $txt)
//        .padding(15)
//}

struct SearchTextField_Previews: PreviewProvider {
    @State static var txt: String = ""
    static var previews: some View {
        SearchTextField(placholder: "Search Products", txt: $txt)
            .padding(15)
    }
}
