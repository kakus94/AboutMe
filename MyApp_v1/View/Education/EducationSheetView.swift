//
//  EducationSheetView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 04/07/2022.
//

import SwiftUI

struct EducationSheetView: View {
  
  @State var model: Education
  @State var year: String = "2002"
  
  @State private var saveingModel: Education?
  
  init(model: Education) {
    self.model = model
    self.year = "\(self.model.startDate)"
    saveingModel = model
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
      .toolbar {
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
            Button(action: {}) {
              Text("Cancel")
                .foregroundColor( .black )
            }
            .RectangleStyle(color: .red, width: 80, height: 30)
          
        }
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
          Button(action: {}) {
            Text("Save")
              .foregroundColor( .black)
          }
          .RectangleStyle(color: .green, width: 80, height: 30)
        }
      }
      
      .onAppear {
        self.year = "\(self.model.startDate)"
      }
      
      
    }
  }
}

struct EducationSheetView_Previews: PreviewProvider {
    static var previews: some View {
      EducationSheetView(model: (Education.Mock()))
    }
}


struct EditingView: View {
  
  @State var placeholder: String
  @Binding var text: String
  
  var body: some View {
    VStack(spacing: 3){
      Text("\(self.placeholder):").frame(maxWidth: .infinity, alignment: .leading).bold()
      TextField(placeholder, text: $text, axis: .vertical)
        .whiteStyle()
    }
  }
}


extension TextField {
  func whiteStyle() -> some View {
    self
      .padding(.horizontal)
      .padding(.vertical, 5)
      .background(Color.white.shadow(radius: 21))
      .cornerRadius(10)
  }
}
