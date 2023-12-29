//
//  AddFoodView.swift
//  MealTracker
//
//  Created by Abdullah Abdulkareem on 12/29/23.
//

import SwiftUI

struct AddFoodView: View {
    
    @State private var foodName = ""
    @State private var calories = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var myFoods: Foods
    
    var body: some View {
        VStack {
            Form{
                Section(header: Text("Food").font(.headline.bold())){
                    TextField("Banana", text: $foodName)
                }
                Section(header: Text("Calories").font(.headline.bold())){
                    TextField("105", value: $calories, format: .number)
                        .keyboardType(.decimalPad)
                }
                
        
            }
            .background(Color.blue.gradient.opacity(0.3))
            .scrollContentBackground(.hidden)
         
            Button{
                let newFood = Food(name: foodName, calories: calories)
                
                myFoods.allFoods.append(newFood)
                dismiss()
            } label: {
                HStack{
                    Image(systemName: "carrot")
                    Text("Add Food")
                }
                .foregroundStyle(.black)
                .font(.headline.bold())
            }
        }

    }
}

#Preview {
    AddFoodView(myFoods: Foods())
    
}
