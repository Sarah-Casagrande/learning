//
//  HomeView.swift
//  learning
//
//  Created by Sarah Casagrande on 8/4/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("What Do You Want to Learn Today?")
                    .padding(.leading, 20)
                ScrollView {
                    
                    LazyVStack {
                        
                        
                        ForEach(model.modules) { module in
                            
                            VStack(spacing: 20) {
                            
                            HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                            HomeViewRow(image: module.test.image, title: "Learn \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                
                            }
                            
                        }
                        
                    }.padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
