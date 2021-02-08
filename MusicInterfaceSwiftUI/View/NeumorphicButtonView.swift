//
//  NeumorphicButtonView.swift
//  MusicInterfaceSwiftUI
//
//  Created by Page Kallop on 2/8/21.
//

import SwiftUI

struct NeumorphicButtonView: View {
    
    @State private var isPressed: Bool = false
    
    private var systemName: String
    private var onTap: () -> Void
    
    init(systemName: String, onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.onTap = onTap
    }
    
    var gray: Color {
        return Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }
    
    var white: Color{
        return Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    
    var body: some View {
       
        Button(action: {
            
            self.isPressed = true
            
            DispatchQueue.main.async {
                self.isPressed = false
                self.onTap()
            }
            
        }){
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(30)
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        }.clipShape(Circle())
        .shadow(color: self.isPressed ? white : gray, radius: self.isPressed ? 4 : 8, x: 8, y: 8)
       .shadow(color: self.isPressed ? white : gray, radius: self.isPressed ? 4 : 8, x: -8, y: -8)
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        .animation(.spring())
    }
}

struct NeumorphicButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicButtonView(systemName: "heart.fill") {}
    }
}
