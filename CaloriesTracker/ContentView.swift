//
//  ContentView.swift
//  CaloriesTracker
//
//  Created by sabiq on 04/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var foodlist=FoodList()
    
    var body: some View {
         NavigationView{
            VStack {
                ForEach(foodlist.foodlist){ food in
                    HStack{
                        VStack{
                            Text("calories:\(food.calories)")
                            Text("from food:\(food.food)")
                        }
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .onTapGesture {
                                foodlist.deletecalories(calories: food)
                            }
                        
                    }
                    .padding()
                    Spacer()
                }
               
            }
            .padding()
            .navigationTitle("Calories Tracker")
            .toolbar(content: {
                Button("Add") {
                    foodlist.showAddCaloriesView.toggle()
                }
            })
            .sheet(isPresented: $foodlist.showAddCaloriesView, content: {
                AddCaloriesView(foodlist: foodlist)
            })
        }
    }
}

struct Calories:Equatable,Identifiable{
    var id = UUID()
    var calories:String
    var food : String
    
}

class FoodList:ObservableObject{
       @Published var foodlist:[Calories] = []
       @Published var showAddCaloriesView = false
    
    func addCalories(food:String, calories:String){
        foodlist.append(Calories(calories: calories, food: food))
        
    }
    
    func deletecalories(calories:Calories ){
       if let index = foodlist.firstIndex(of: calories){
            foodlist.remove(at: index)
        }
        
    }
    
    
}




#Preview {
    ContentView()
}
