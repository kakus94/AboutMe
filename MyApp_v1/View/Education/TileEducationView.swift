//
//  TileEducationView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 27/06/2022.
//

import SwiftUI



struct TileEducationView: View {
  
  @State var trigger: Bool = false
  
  @Binding var model: Education
  
  @Binding var editEnable: Bool
  
  @State var handler: () -> Void
  @State var delateThisItem: () -> Void
  
  @State private var editButtonTap: Bool = false
  @State private var deleteButtonTap: Bool = false
  
  var body: some View {
    
    HStack(spacing: 0){
      TreeAndYearView
        .frame(height: UIScreen.main.bounds.height / 7)
        .padding(.trailing)
      
      TileSubView
        .FormStyle()
    }
    .animation(.default, value: trigger)
    .animation(.default, value: editEnable)
    .sheet(isPresented: $editButtonTap) {
      EducationSheetView(model: model)
    }
    .confirmationDialog("Cos", isPresented: $deleteButtonTap, titleVisibility: Visibility.automatic) {
      Button("Usuń", role: .destructive) {
        delateThisItem()
        
      }
    } message: {
      Text("Czy napewno chcesz usunać ?")
    }
   
  }
  
  var TileSubView: some View {
    VStack {
      Button(action: { trigger.toggle(); handler() }) {
        HStack {
          Image(systemName: "person")
            .resizable()
            .scaledToFit()
            .frame(height: 40)
            .foregroundColor(.black)
          
          VStack{
            Group{
              Text(model.nameSchool)
                .font(.body.bold())
              
              Text(model.location)
                .font(.subheadline)
              
              Text("\(model.schooleGrade)")
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
          }
          .padding(.horizontal)
          
          Image(systemName: self.trigger ?  "arrow.turn.right.down" : "arrow.forward" )
            .foregroundColor(.black)
          
        }
        .frame(height: 50)
      }
      .padding()
        
      if trigger {
        TilieEducationDetailsView(educationDetails: model.details)
          .padding([.horizontal, .bottom])
      }
      
      if editEnable {
       
        HStack(spacing: 0){
          Button(action: editButton) {
            Text("Edit")
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
              .background(Color.green)
          }
          
          Button(action: deleteButton) {
            Text("Delete")
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
              .background(Color.red)
          }
        }
        .frame(height: 40)
      }
    }
    
  }
  
  var TreeAndYearView: some View {
    VStack(spacing: 0) {
      Text("\(model.startDate)")
        .font(.headline.bold())
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.leading)
    }
    .frame(width: 60)
  }
  
  //Edit button
  func editButton() {
    self.editButtonTap = true
  }
  
  //Edit button
  func deleteButton() {
    self.deleteButtonTap = true
  }
  
}


struct TileEducationDetails: Codable {
  var specialization: String = ""
  var extraClasses: String = ""
  var project: String = ""
  
  static var Mock = TileEducationDetails(specialization: " spec spec spec", extraClasses: "extara extara", project: "project project project")
}

struct TilieEducationDetailsView: View {
  
  @State var educationDetails: TileEducationDetails
  
  var body: some View{
    VStack {
      Divider()
      if !educationDetails.specialization.isEmpty {
        Text("Specialization:")
          .maxFrameLeading
          .bold()
        
        Text(" \(educationDetails.specialization)")
          .maxFrameLeading
      }
    
      if !educationDetails.extraClasses.isEmpty {
        Divider()
        Text("Extra classes:")
          .maxFrameLeading
          .bold()
        Text(" \(educationDetails.extraClasses)")
          .maxFrameLeading
      }
      
      if !educationDetails.project.isEmpty {
        Divider()
        Text("Completed project:")
          .maxFrameLeading
          .bold()
        
        Text(" \(educationDetails.project)")
          .maxFrameLeading
      }
    
     
    }
  }
}

extension Text {
  var maxFrameLeading: some View {
    self
     
      .frame(maxWidth: .infinity, alignment: .leading)
    
  }
}





extension View {
  func FormStyle(_ color: Color = .white.opacity(0.3)) -> some View {
    self
      .background(color)
      .cornerRadius(10)
      .shadow(radius: 15,x: 5,y:5)
     
  }
}




struct TileEducationView_Previews: PreviewProvider {
    static var previews: some View {
      TileEducationView(trigger: false,
                        model: .constant(Education.Mock()),
                        editEnable: .constant(true),
                        handler: {}, delateThisItem: {})
        .AppBackground()
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Tile false")
      
      TileEducationView(trigger: true,
                        model: .constant(Education.Mock()),
                        editEnable: .constant(true),
                        handler: {}, delateThisItem: {})
        .AppBackground()
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Tile true")
    }
}
