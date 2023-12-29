//
//  FoodView.swift
//  MealTracker
//
//  Created by Abdullah Abdulkareem on 12/29/23.
//

import SwiftUI

struct FoodView: View {
    let calorieAmount: String
    let myFood: [Food]
    let deleteItems: (IndexSet) ->Void
    
    var body: some View {
        Section(calorieAmount) {

            ForEach(myFood){ food in
                
                HStack{
                    Text(food.name)
                    Spacer()
                    Text(String(food.calories.formatted()))
                        .foregroundStyle(getCaloriesTextColor(for: food.calories))
                        .bold()
                }
                .frame(maxWidth: .infinity, minHeight: 50)
               
                
                
            }
            .onDelete(perform: deleteItems)
            
        }

    }
    
    func getCaloriesTextColor(for amount: Double) -> Color {
        if amount < 500 {
            return .green
        } else if amount < 1000 {
            return .yellow
        }
        
        return .red
    }
}

#Preview {
    FoodView(calorieAmount: "Low Calorie",myFood: []) {_ in}
}
