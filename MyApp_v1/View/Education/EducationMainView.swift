//
//  EducationViewMain.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct EducationMainView: View {
  
  
    var body: some View {
      ScrollView() {
        TileEducationView(trigger: .constant(false))
        
        TileEducationView(trigger: .constant(false))
        
        TileEducationView(trigger: .constant(false))
        
        TileEducationView(trigger: .constant(false))
        
        TileEducationView(trigger: .constant(false))
      
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
        
    }
}

struct EducationMainView_Previews: PreviewProvider {
    static var previews: some View {
      EducationMainView()
    }
}
