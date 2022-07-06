//
//  EducationViewMain.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

class EducationMainViewModel: ObservableObject {
  @Published var educations: [Education] = .init()
  
  
  func delete(_ id: String){
    educations.removeAll { item in
      item.id == id
    }
  }
  
  func delete(_ object: Education) {
    educations.removeAll { item in
      item.id == object.id
    }
  }
  
  static func Mock(_ count: Int) -> EducationMainViewModel {
    let model = EducationMainViewModel()
    
    for i in Range(0...count){
      model.educations.append(Education(nameSchool: "Mock Name \(i)",
                                        location: "location \(i)",
                                        schooleGrade: "\(Double.random(in: 2...5))",
                                        startDate:  i * 4 + 2000,
                                        details: TileEducationDetails.Mock))
    }
    
    return model
  }
}

struct EducationMainView: View {
  
  @StateObject var modelView: EducationMainViewModel
  
  @State  var animate:    Bool = false
  @State var editEnable:  Bool = false
  @State var addedNew:    Bool = false
  
    var body: some View {
      
      VStack {
        
        if editEnable {
          ButtonAddedSubView
        }
        
        ScrollView() {
          ForEach(modelView.educations.indices, id: \.self) { index in
            TileEducationView(model: $modelView.educations[index],
                              editEnable: $editEnable,
                              handler: { animate.toggle() },
                              delateThisItem: { modelView.delete(modelView.educations[index]) })
          }
          
        }
      }      
   
      .animation(.default, value: animate)
      .animation(.default, value: editEnable)
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .navigationTitle("Educations")
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: editButtonAction) {
            Text(editEnable ? "Done" : "Edit")
              .foregroundColor(.white)
          }
        }
      })
      .sheet(isPresented: $addedNew, content: {
        AddedEducationView(show: $addedNew) { newEducation in
          modelView.educations.append(newEducation)
        }
      })
      .AppBackground()
        
    }
  
  
  //Layout
  var ButtonAddedSubView: some View {
    Button(action: { addedNew = true }) {
      Text("Added +")
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width  / 1.5, height: 50, alignment: .center)
        .background(.green)
        .cornerRadius(15)
    }
    .padding()
  }
  
  //Logic
  func editButtonAction() {
    editEnable.toggle()
    
    
  }
}

struct EducationMainView_Previews: PreviewProvider {
    static var previews: some View {
      EducationMainView(modelView: EducationMainViewModel.Mock(5))
    }
}
