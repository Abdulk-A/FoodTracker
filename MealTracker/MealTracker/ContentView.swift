//
//  ContentView.swift
//  MealTracker
//
//  Created by Abdullah Abdulkareem on 12/29/23.
//





import SwiftUI

struct ContentView: View {
    
    @State private var myFoods = Foods()

    
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    FoodView(calorieAmount: "Low Calorie", myFood: myFoods.lowCalories, deleteItems: removeLowCalorieFood)
                    FoodView(calorieAmount: "Medium Calorie", myFood: myFoods.mediumCalories, deleteItems: removeMediumCalorieFood)
                    FoodView(calorieAmount: "High Calorie", myFood: myFoods.highCalories, deleteItems: removeHighCalorieFood)
                }
                Text("Calories Consumed \(myFoods.totalCalories.formatted())")
            }
            .toolbar{
                Button{
                    showAddSheet.toggle()
                        
                }label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
            .sheet(isPresented: $showAddSheet){
                AddFoodView(myFoods: myFoods)
            }
            .navigationTitle("FoodTracker")
        }

    }
    

    
    func removeItems(at offsets: IndexSet, in inputArray: [Food]){
        var objectsToDelete = IndexSet()
        
        
        //finding the first index of the selected food
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = myFoods.allFoods.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
            
            myFoods.allFoods.remove(atOffsets: objectsToDelete)
        }
    }

    func removeLowCalorieFood(at offsets: IndexSet){
        removeItems(at: offsets, in: myFoods.lowCalories)
    }
    func removeMediumCalorieFood(at offsets: IndexSet){
        removeItems(at: offsets, in: myFoods.mediumCalories)
    }
    func removeHighCalorieFood(at offsets: IndexSet){
        removeItems(at: offsets, in: myFoods.highCalories)
    }
}

#Preview {
    ContentView()
}
