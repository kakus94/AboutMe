//
//  ProjectView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 18/08/2022.
//

import SwiftUI

extension CareerDetailSheetView {
  
  
  
  struct ProjectView: View {
    
    @Binding var projects: [Project]
    @Binding var triger: Bool
    
    var body: some View {
      VStack {
        
        Text("Projects:")
          .bold()
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(.bottom, 5)
        
        VStack(spacing: 10) {
          
          ForEach(projects.indices, id: \.self ) { i in
            
                        ProjectSubView(project: $projects[i],
                                       editingTriger: $triger)
            
            if triger {
              Button(action: { projects.remove(at: i) }) {
                Text("delete")
                  .foregroundColor(.black)
              }
              .RectangleStyle(color: .red.opacity(0.7),height: 25)
            }
            
            
            Divider()
          }
          
          if triger {
            Button(action: { projects.append(Project(nameProject: "",
                                                     StartDate: Date.now,
                                                     EndDate: Date.now,
                                                     now: false)) }){
              Text("add+")
                .foregroundColor(.black)
            }
                                                     .RectangleStyle(color: .white,width: UIScreen.main.bounds.width * 0.6, height: 25 )
          }
          
        }
        .padding(.horizontal)
      }
    }
  }
}
  struct ProjectSubView: View {
    
    @Binding var project: Project
    @Binding var editingTriger: Bool
    
    var body: some View {
      VStack {
        
        LineView(placeholder: "Name project", text: $project.nameProject, editingTriger: $editingTriger)
        LineDateView(placeholder: "Start date", date: $project.StartDate, editingTriger: $editingTriger)
        
        if editingTriger {
          Toggle(isOn: $project.now) {
            Text("Date / Continous:")
              .bold()
          }
        }
       
        if project.now {
          HStack{
            Text("End date:")
              .frame(maxWidth: .infinity, alignment: .leading)
              .bold()
            Image(systemName: "infinity")
          }
          
        } else {
          LineDateView(placeholder: "End date", date: $project.EndDate, editingTriger: $editingTriger)            
        }
      }
    }
  }
  


struct ProjectView_Previews: PreviewProvider {
  static var previews: some View {
    CareerDetailSheetView.ProjectView(projects: .constant([Project.Mock()]), triger: .constant(true))
  }
}
