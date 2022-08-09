//
//  TestView.swift
//  learning
//
//  Created by Sarah Casagrande on 8/9/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            VStack {
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        } else {
            ProgressView()
        }
        
        CodeTextView()
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
