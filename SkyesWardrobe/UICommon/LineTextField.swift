//
//  LineTextField.swift
//  SkyesWardrobe
//
//  Created by Hikma Muneer on 2024-03-18.
//

import SwiftUI

struct LineTextField : View {
    @State var title : String = "Title"
    @State var placeholder : String = "Placeholder"
    @Binding var txt : String
    @State var keyboardType: UIKeyboardType = .default
    
    
    var body: some View {
        
        VStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder,text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .frame(height: 40)
            
            Divider()
            
        }
    }
}

struct LineSecureField : View {
    @State var title: String = "Title"
    @State var placeholder : String = "Placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool


    var body: some View {
        
        VStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword){
                TextField(placeholder,text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
                
            }else{
                SecureField(placeholder,text: $txt)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
                
            }
            
            Divider()
            
        }
    }
}




struct LineTextField_Previews: PreviewProvider{
    @State static var txt : String = ""
    static var previews: some View{
        LineTextField(txt: $txt)
            .padding(20)
    }
}


//#Preview {
//    @State var txt : String = ""
//    LineTextField(txt: $txt)
//}
