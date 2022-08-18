//
//  TileCareerView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 14/08/2022.
//

import SwiftUI

struct TileCareerView: View {
  
  @Binding var career: Career
  
  var body: some View {
    VStack{
      VStack(spacing: 10) {
        //Name Company
        HStack{
          Text(career.nameCompany)
            .font(.title2)
            .bold()
          Spacer()
          Image(systemName: "arrow.right")
            .font(.title)
        }
        
        Divider()
        
        TileLineView(leftString: "Start date:",
                 rightString: career.startDate.getMonthAndYear(.medium))
        
        TileLineView(leftString: "End date:",
                 rightString: career.endDate.getMonthAndYear(.medium))
        
        TileLineView(leftString: "Position in the company:",
                 rightString: career.position)
        
        
      }
      .padding()
    }
    .frame(maxWidth: .infinity)
    .FormStyle()
    .padding()
  }
}

 struct TileLineView: View {
  
  @State var leftString: String
  @State var rightString: String
  
  var body: some View{
    HStack{
      Text(leftString).bold()
      Spacer()
      Text(rightString)
    }
  }
}

struct TileCareerView_Previews: PreviewProvider {
  static var previews: some View {
    TileCareerView(career: .constant(Career.Mock()))
      .AppBackground()
  }
}
