//
//  Food.swift
//  MealTracker
//
//  Created by Abdullah Abdulkareem on 12/29/23.
//

import SwiftUI


struct Food: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let calories: Double
}

@Observable
class Foods {
    
    
    var allFoods = [Food]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(allFoods) {
                UserDefaults.standard.set(encoded, forKey: "allFoods")
            }
        }
    }
    
    var totalCalories: Double{
        allFoods.reduce(0){$0 + $1.calories}
    }
    
    var lowCalories: [Food] {
        allFoods.filter{
            $0.calories < 500
        }
    }
    
    var mediumCalories: [Food] {
        allFoods.filter{
            $0.calories < 1000 && $0.calories >= 500
        }
    }
    
    
    var highCalories: [Food] {
        allFoods.filter{
            $0.calories >= 1000
        }
    }
    
    init(){
        
        if let savedItems = UserDefaults.standard.data(forKey: "allFoods") {
            if let decodedItems = try? JSONDecoder().decode([Food].self, from: savedItems){
                allFoods = decodedItems
                return
            }
        }
        
        
        allFoods = []
    }
}
