//
//  TestView.swift
//  learning
//
//  Created by Sarah Casagrande on 8/9/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack(alignment: .leading) {
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
            CodeTextView()
                .padding(.horizontal, 20)
            
            ScrollView {
                VStack {
                    ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                        
                        Button {
                            selectedAnswerIndex = index
                        } label: {
                            
                            ZStack {
                                
                                if submitted == false {
                                    RectangleCard(color: index == selectedAnswerIndex ? .gray : .white )
                                        .frame(height: 48)
                                }
                                else {
                                    // Answer has been submitted
                                    if index == selectedAnswerIndex &&
                                        index == model.currentQuestion!.correctIndex {
                                        
                                        // User has selected the right answer
                                        // Show a green background
                                        RectangleCard(color: Color.green)
                                            .frame(height: 48)
                                    }
                                    else if index == selectedAnswerIndex &&
                                                index != model.currentQuestion!.correctIndex {
                                        
                                        // User has selected the wrong answer
                                        // Show a red background
                                        RectangleCard(color: Color.red)
                                            .frame(height: 48)
                                    }
                                    else if index == model.currentQuestion!.correctIndex {
                                        
                                        // This button is the correct answer
                                        // Show a green background
                                        RectangleCard(color: Color.green)
                                            .frame(height: 48)
                                    }
                                    else {
                                        RectangleCard(color: Color.white)
                                            .frame(height: 48)
                                    }
                                    
                                }
                                
                                Text(model.currentQuestion!.answers[index])
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                            }
                        }
                        .disabled(submitted)
                    }
                }.padding()
                    .accentColor(.black)
            }
            
            Button {
                if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                    numCorrect += 1
                }
                submitted = true
            } label: {
                ZStack {
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    Text("Submit")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .disabled(selectedAnswerIndex == nil)
            .padding(.horizontal, 20)
            
            
        } else {
            ProgressView()
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
