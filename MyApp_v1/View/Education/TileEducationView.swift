//
//  TileEducationView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 27/06/2022.
//

import SwiftUI

struct TileEducationView: View {
  
  @Binding var trigger: Bool
  
  var body: some View {
    HStack(spacing: 0){
      VStack(spacing: 0) {
        
        Rectangle()
        .frame(width: 3)
        
        Text("2011")
          .font(.headline.bold())
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(.leading)
        
          Rectangle()
          .frame(width: 3)
      }
      .frame(width: 60)
      
      
      HStack {
        Image(systemName: "person")
          .resizable()
          .scaledToFit()
        
        VStack{
          Group{
            Text("Hello, World!")
              .font(.body.bold())
            
            Text("Lokalizacja")
              .font(.subheadline)
            
            Text("school grade")
              .font(.caption)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        
        Image(systemName: self.trigger ?  "arrow.turn.right.down" : "arrow.forward" )
        
      }
      .frame(height: 50)
      .FormStyle()
    }
    .frame(height: 150)
    
  }
}

struct TileEducationView_Previews: PreviewProvider {
    static var previews: some View {
      TileEducationView(trigger: .constant(false))
        .AppBackground()
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Tile false")
      
      TileEducationView(trigger: .constant(true))
        .AppBackground()
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Tile true")
    }
}


extension View {
  func FormStyle() -> some View {
    self
      .padding()
      .background(.white.opacity(0.3))
      .cornerRadius(10)
      .padding()
      .shadow(radius: 15,x: 5,y:5)
     
  }
}
