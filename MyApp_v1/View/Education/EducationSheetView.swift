//
//  EducationSheetView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 04/07/2022.
//

import SwiftUI

struct EducationSheetView: View {
  
  @Binding var model: Education
  @State var year: String = "2002"
  
  init(model: Binding<Education>) {
    self._model = model
    self.year = "\(self.model.startDate)"
  }
  
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
        
      }
      .padding()
      .navigationTitle("Education")
      .navigationBarTitleDisplayMode(.inline)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .AppBackground()
      
      .onAppear {
        self.year = "\(self.model.startDate)"
      }
      
      
    }
  }
}

struct EducationSheetView_Previews: PreviewProvider {
    static var previews: some View {
      EducationSheetView(model: .constant(Education.Mock()))
    }
}


struct EditingView: View {
  
  @State var placeholder: String
  @Binding var text: String
  
  var body: some View {
    VStack(spacing: 3){
      Text("\(self.placeholder):").frame(maxWidth: .infinity, alignment: .leading).bold()
      TextField(placeholder, text: $text)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color.white.shadow(radius: 21))
        .cornerRadius(10)        
    }
  }
}
