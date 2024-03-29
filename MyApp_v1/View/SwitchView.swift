//
//  SwitchView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 25/05/2022.
//

import SwiftUI

struct SwitchView: View {
  
  @Binding var selectedTab: Tab
  
    var body: some View {
      VStack{
        switch selectedTab {
        case .aboutme:
          AboutMeMainView(aboutMeMainVM: AboutMeMainViewModel.Mock())
        case .education:
          EducationMainView(modelView: EducationMainViewModel())
        case .career:
          CareerMainView()
        case .myproject:
          MyProjectMainView()
        case .hooby:
          HobbyMainView()
        case .placesvisited:
          PlacesVisitedMainView()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.top)
      .background( Color.blue.gradient)
      
 
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
      SwitchView(selectedTab: .constant(.aboutme))
    }
}

enum Tab: Int{
  case aboutme, education, career, myproject, hooby, placesvisited
}
