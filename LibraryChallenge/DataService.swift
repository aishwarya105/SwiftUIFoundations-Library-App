//
//  DataService.swift
//  LibraryChallenge
//
//  Created by Aishwarya Agarwal on 12/29/21.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Book] {
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let bookdata = try decoder.decode([Book].self, from: data)
                
                return bookdata
                
            } catch {
                print(error)
            }
        } catch{
            print(error)
        }
        
       return [Book]()
    }
}
