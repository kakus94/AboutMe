//
//  AddedEducationView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 04/07/2022.
//

import SwiftUI

struct AddedEducationView: View {
  
  
  @State var model: Education = Education.Empty()
  
  @Binding var show: Bool
  
  @State var saveHandler: (Education) -> Void
  
  @State private var year: String = "" 
  
  var body: some View {
    NavigationStack{
      VStack {
        
        EditingView(placeholder: "Name", text: $model.nameSchool)
        
        EditingView(placeholder: "Location", text: $model.location)
          
        EditingView(placeholder: "SchooleGrade", text: $model.schooleGrade)

        EditingView(placeholder: "StartDate", text: $year)

        EditingView(placeholder: "Specialization", text: $model.details.specialization)

        EditingView(placeholder: "Extra Classes", text: $model.details.extraClasses)

        EditingView(placeholder: "Project", text: $model.details.project)
        
        HStack{
          Button {
            model.startDate = Int(year) ?? 0
            saveHandler(model)
            show = false
          } label: {
            Text("Save")
              .frame(width: UIScreen.main.bounds.width / 3, height: 50)
              .foregroundColor(.black)
              .background(.green)
              .cornerRadius(15)
          }
          
          Spacer()
          
          Button {
            show = false
          } label: {
            Text("Cancel")
              .frame(width: UIScreen.main.bounds.width / 3, height: 50)
              .foregroundColor(.black)
              .background(.red)
              .cornerRadius(15)
          }

        }
        .padding()
        
      }
      .padding()
      .navigationTitle("Education")
      .navigationBarTitleDisplayMode(.inline)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .AppBackground()
    }
  }
}

struct AddedEducationView_Previews: PreviewProvider {
    static var previews: some View {
      AddedEducationView( show: .constant(false), saveHandler: { _ in })
    }
}
