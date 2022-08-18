//
//  CareerDetailSheetView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 14/08/2022.
//

import SwiftUI

struct CareerDetailSheetView: View {
  
  @State var career: Career
  @State var mode: Mode = .edit
  @State var saveHandler: (Career) -> Void
  @State var deleteHandler: ((Career) -> Void)?
  
  @State private var triger: Bool = false
  @State private var savetemp: Career?
  
  @Environment(\.dismiss) private var dismiss
  
  enum Mode {
    case edit, new
  }
  
  
  var body: some View {
    ScrollView {
      if triger {
        ButtonSectionView
      }
      
      Group {
        LineView(placeholder: "Name company",
                 text: $career.nameCompany,
                 editingTriger: $triger)
        Divider()
        LineView(placeholder: "Position",
                 text: $career.position,
                 editingTriger: $triger)
        Divider()
        LineView(placeholder: "Obligatory",
                 text: $career.obligatory,
                 editingTriger: $triger)
        Divider()
        LineDateView(placeholder: "Start end", date: $career.startDate, editingTriger: $triger)
        Divider()
        LineDateView(placeholder: "Start end", date: $career.endDate, editingTriger: $triger)
      }
      
      Divider()
      
      TrainingView(training: $career.training, triger: $triger)
      
      Divider()
      
      ProjectView(projects: $career.project , triger: $triger)
      
      Divider()
      DescriptionView(content: $career.description, editingTriger: $triger)
      
      
      
    }
    .animation(.default, value: triger)
    .frame(maxWidth: .infinity,maxHeight: .infinity)
    .padding()
    .onAppear{
      triger = mode == .new ? true : triger
    }
    .toolbar {
      ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
        if mode == .edit {
          Button(action: triger ? cancelAction : editAction ){
            Text(triger ? "Cancel" : "Edit")
              .foregroundColor(triger ? .red : .white)
          }
        } else {
          Button(action: cancelNewAction ){
            Text( "Cancel" )
              .foregroundColor( .red )
          }
        }
      }
    }
    
  }
  
  //Layout
  @ViewBuilder var ButtonSectionView: some View {
    HStack {
      Button(action: deleteAction) {
        Text("Delete")
          .foregroundColor(.black)
      }
      .RectangleStyle(color: .red.opacity(0.7), width: UIScreen.main.bounds.width * 0.4)
      
      Button(action: saveAction) {
        Text("Save")
          .foregroundColor(.black)
      }
      .RectangleStyle(color: .green.opacity(0.7), width: UIScreen.main.bounds.width * 0.4)
    }
  }
  
  //Logic
  func editAction() {
    triger.toggle()
    savetemp = career
  }
  
  func cancelAction() {
    triger.toggle()
    career = savetemp!
    savetemp = nil
  }
  
  func cancelNewAction() {
    dismiss()
  }
  
  func deleteAction() {
    guard let deleteHandler else { return }
    deleteHandler(career)
    dismiss()
  }
  
  func saveAction() {
    saveHandler(career)
    dismiss()
  }
}






  
   struct LineDateView: View {
    
    @State var placeholder: String
    @Binding var date: Date
    @Binding var editingTriger: Bool
    
    var body: some View {
      VStack{
        if editingTriger {
          HStack {
            Text("\(placeholder):")
              .bold()
            Spacer()
            DatePicker(selection: $date, displayedComponents: .date, label: { })
//              .applyTextColor(.black)
//              .cornerRadius(5)
            
          }
        } else {
          HStack {
            Text("\(placeholder):")
              .bold()
            Spacer()
            Text(date.getMonthAndYear(.medium)).bold()
          }
        }
      }
      .onAppear{
        UIDatePicker.appearance().backgroundColor = UIColor.init(.green.opacity(0.2)) // changes bg color
        UIDatePicker.appearance().tintColor = UIColor.init(.blue) // changes font color
        
      }
    }
  }
  
   struct DescriptionView: View {
    
    @Binding var content: String
    @Binding var editingTriger: Bool
    
    var body: some View {
      VStack {
        Text("Description:")
          .frame(maxWidth: .infinity, alignment: .leading)
          .bold()
        
        if editingTriger {
          TextEditor(text: $content)
            .frame(maxWidth: .infinity,minHeight: UIScreen.main.bounds.height / 6)
            .cornerRadius(10)
        } else {
          Text(content)
        }
        
      }
    }
  }
  
   struct LineView: View {
    
    @State var placeholder: String
    @Binding var text: String
    @Binding var editingTriger: Bool
    
    var body: some View {
      VStack {
        if editingTriger {
          EditingView(placeholder: placeholder, text: $text)
        } else {
          HStack {
            Text("\(placeholder):")
              .bold()
            Spacer()
            Text(text)
              .bold()
          }
        }
      }
      .animation(.default, value: editingTriger)
    }
  }
  
  






struct CareerDetailSheetView_Previews: PreviewProvider {
  static var previews: some View {
    CareerDetailSheetView(career: (Career.Mock()), saveHandler: { _ in })
      .AppBackground()
  }
}
