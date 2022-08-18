//
//  CareerMainView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct CareerMainView: View {
  
  @StateObject var model: CareerMainViewModel = CareerMainViewModel.Mock()
  
    var body: some View {
      ScrollView {
        ForEach(model.careers.indices, id: \.self) { i in
          NavigationLink {
            CareerDetailSheetView(career: model.careers[i],
                                  saveHandler:    { item in model.Save(item)},
                                  deleteHandler:  { item in model.Delete(item)})
              .AppBackground()
          } label: {
            TileCareerView(career: $model.careers[i])
              .foregroundColor(.black)
          }

          
        }
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
      .toolbar {
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
          NavigationLink {
            CareerDetailSheetView(career: Career.Empty(), mode: .new) {
              model.Add($0)
            }
            .AppBackground()
          } label: {
            Text("New")
          }

        }
      }
    }
}

struct CareerMainView_Previews: PreviewProvider {
    static var previews: some View {
        CareerMainView()
    }
}
