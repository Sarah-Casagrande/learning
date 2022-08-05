//
//  ContentModel.swift
//  learning
//
//  Created by Sarah Casagrande on 8/4/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonURL!)
            let jsonDecoder = JSONDecoder()
            
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
            
        } catch {
            print("Couldn't parse local data.")
        }
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // Log error
            print("Couldn't parse style data")
        }
        
    }
    
    func beginModule(_ moduleId:Int) {
        
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
        
    }
}
