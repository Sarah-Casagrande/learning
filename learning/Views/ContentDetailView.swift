//
//  ContentDetailView.swift
//  learning
//
//  Created by Sarah Casagrande on 8/5/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            CodeTextView()
            
            
            if model.hasNextLesson() {
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex+1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
            else {
                Button {
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete Module")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
        }
        .padding(.all)
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
