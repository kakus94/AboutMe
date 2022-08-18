//
//  AboutMeViewMain.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

class AboutMeMainViewModel: ObservableObject{
  
  @Published var personModel: PersonModel?
  @Published var user: User?
  
  
  func calcAge() -> Int {
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calcAge = calendar.components(.year, from: personModel!.birthday!, to: now, options: [])
    let age = calcAge.year
    return age!
  }
  
  static func Mock() -> AboutMeMainViewModel{
    let model = AboutMeMainViewModel()
    model.personModel = PersonModel.Mock()
    return model
  }
}

struct AboutMeMainView: View {
  
  @StateObject var aboutMeMainVM: AboutMeMainViewModel
  
    var body: some View {
      VStack  {
        PresentProfileSubView
        ScrollView(showsIndicators: false) {
          if let aboutMe = aboutMeMainVM.personModel?.aboutME {
            Text( aboutMe )
          }
        }
        .padding()
        .background(.white.opacity(0.2))
        .cornerRadius(15)
        .padding()
      }
      .navigationTitle("About Me")
      .frame( maxWidth: .infinity, maxHeight: .infinity)
      .AppBackground()
    }
  
  //layout
  var PresentProfileSubView: some View {
    HStack {
      Image("profil")
        .resizable()
        .scaledToFill()
        .frame(width: 150, height: 150, alignment: .center)
        .clipShape(Circle())
      
      VStack(spacing: 10){
        //Name and lastname
        if let name = aboutMeMainVM.personModel?.name,
           let lastName = aboutMeMainVM.personModel?.lastName {
          Text("\(name) \(lastName)")
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.title3.bold())
        }
        
        //Birthday
        Text("Age:\(aboutMeMainVM.calcAge())")
          .frame(maxWidth: .infinity,alignment: .leading)
          .font(.body.bold())
        
        //Profesion
        if let profesion = aboutMeMainVM.personModel?.profesion {
          Text(profesion)
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.body.bold())
        }
      }
      .padding(.leading)
     
    }
    .padding([.horizontal, .top])
  }
  
}

struct AboutMeMainView_Previews: PreviewProvider {
    static var previews: some View {
      AboutMeMainView(aboutMeMainVM: AboutMeMainViewModel.Mock())
    }
}
