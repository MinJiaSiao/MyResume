//
//  ContentView.swift
//  MyResume
//
//  Created by Minjia on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    @State var isShowingContact = false
    
    
    var body: some View {
        ScrollView {
        VStack (spacing: 30) {
            HStack {
                Image("maysiao")
                    .resizable().aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width:200)
                VStack (spacing: 20) {
                    Text(me.name)
                        .font(.title).bold()
                    Text(me.title)
                    Label(me.location, systemImage: "location.fill" ).foregroundColor(.secondary)
              }
           }
            Text(me.bio).font(.title3).lineSpacing(10)
            
            Button {
               isShowingContact = true
                
               
                
            } label: {
                Text("Contact Me")
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle (cornerRadius: 20).foregroundColor(.brown))
            }
            
            
            Text("Skills")
                .font(.title2.bold())
                .padding(.trailing,300)
            HStack {
                ForEach(me.skills, id: \.self) { skill in
                    VStack {
                        Image(skill.lowercased())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:50)
                        Text(skill)
                    }.frame(width:80)
            
                }
            }
          
            Text("Experience")
                .font(.title2.bold())
                .padding(.trailing,230)
            
            VStack (spacing: 0) {
                ForEach(me.experiences.indices, id: \.self) { index in
                    
                    HStack {
                        
                        circleStraightShape(lineWidth: 3,
                                            circleSize: 15,
                                            style: index == 0 ? .bottomHalf : index == me.experiences.count - 1 ? .topHalf : .full )
                            .frame(width: 70)
                            .foregroundColor(.secondary)
                        
                        let exp = me.experiences[index]
                        
                        VStack {
                            Group {
                                Text("\(exp.start)- \(exp.end) ").foregroundColor(.secondary)
                                Text("\(exp.title)")
                                Text("\(exp.company)")
                            }.frame(maxWidth: .infinity, alignment: .leading)
                        }
                    
                        
                    }
                    
                }
            }
        }
        .padding()
        .overlay(Color.black.opacity(isShowingContact ? 0.5 : 0))
        .overlay(alignment: .top) {
            Group {
                if (isShowingContact) {
                    ContactView(isShowing: $isShowingContact)
                        .offset(y: UIScreen.main.bounds.maxY*0.32)
                        .transition(.slide)
                    }
                    
                    }
                   
                       
                }
                .animation(.spring(), value: isShowingContact)
        }.background(Color(uiColor: .secondarySystemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
