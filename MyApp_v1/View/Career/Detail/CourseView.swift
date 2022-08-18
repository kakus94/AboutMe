//
//  CourseView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 18/08/2022.
//

import SwiftUI

extension CareerDetailSheetView {
  
  
  struct TrainingView: View {
    
    @Binding var training: [Training]
    @Binding var triger: Bool
    
    var body: some View {
      VStack {
        Text("Trainig:")
          .bold()
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(.bottom, 5)
        VStack(spacing: 10){
          ForEach(training.indices, id: \.self) { i in
            
            TrainingSubView(trainig: $training[i],
                            editingTriger: $triger,
                            delateHandler: { del in training.removeAll{ $0.id == del.id} })
            Divider()
          }
          if triger {
            Button(action: { training.append(Training(date: Date.now, nameTraing: "")) } ){
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

  private struct TrainingSubView: View {
    
    @Binding var trainig: Training
    @Binding var editingTriger: Bool
    @State var delateHandler: (Training) -> Void
    @State var str: String = "fdsfds fdg  gfd hfd fd"
    
    var body: some View {
      VStack{
        if editingTriger {
          HStack {
            TextField("Name course", text: $trainig.nameTraing, axis: .vertical)
              .whiteStyle()
              .bold()
            Spacer()
            DatePicker(selection: $trainig.date, displayedComponents: .date, label: { })
            if editingTriger {
              Button(action: { delateHandler(trainig) }) {
                Image(systemName: "trash.square.fill")
                  .resizable()
                  .frame(width: 30,height: 30)
                  .foregroundColor(.red)
              }
            }
          }
        } else {
          HStack {
            Text("\(trainig.nameTraing):")
              .bold()
            Spacer()
            Text(trainig.date.getMonthAndYear(.medium)).bold()
          }
        }
        
        
      }
    }
  }




struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
      CareerDetailSheetView.TrainingView(training: .constant([Training.Mock(),Training.Mock()]), triger: .constant(true))
    }
}
