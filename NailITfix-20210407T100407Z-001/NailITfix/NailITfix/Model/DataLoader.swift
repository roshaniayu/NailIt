//
//  DataLoader.swift
//  Nailit
//
//  Created by Dicky Buwono on 01/04/21.
//

import Foundation
public class DataLoader {
    
    @Published var questionAll = [QuestionTech]()
   
    
    init(id: Int) {
        if id == 0 {
            load()
            sort()
            
        }else if id == 1{
            load2()
            sort()
        }else if id == 2{
            load3()
            sort()
        }else if id == 3{
            load4()
            sort()
        }else if id == 4{
            load5()
            sort()
        }else if id == 5{
            load6()
            sort()
        }else if id == 6{
            load7()
            sort()
        }else if id == 7{
            load8()
            sort()
        }else {
            print("error")
        }
            
    }
    
    
    /// Load data swift
    func load() {
       
            if let fileLocation = Bundle.main.url(forResource: "QuestionSwift", withExtension: "json") {
                
                // do catch in case of an error
                do {
                    let data = try Data(contentsOf: fileLocation)
                    let jsonDecoder = JSONDecoder()
                    let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)
                    
                    self.questionAll = dataFromJson
                } catch {
                    print(error)
                }
            }
            
        
        
    }
    
    ///sorting
    func sort() {
        self.questionAll = self.questionAll.sorted(by: { $0.q_id < $1.q_id })
    }
    
    
    ///load data python
    func load2() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionPython", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    
    func load3() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionJava", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func load4() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionCharacter", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func load5() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionCompany", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func load6() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionExperience", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func load7() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionSkill", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func load8() {

        if let fileLocation = Bundle.main.url(forResource: "QuestionTeamwork", withExtension: "json") {

            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([QuestionTech].self, from: data)

                self.questionAll = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    
}
