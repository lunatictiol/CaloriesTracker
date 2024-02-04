//
//  AddCaloriesView.swift
//  CaloriesTracker
//
//  Created by sabiq on 04/02/24.
//

import SwiftUI

struct AddCaloriesView: View {
    
    @State private var caloriesTitle :String = "Enter Clories"
    @State private var foodTitle :String = "Enter Food"
    @State private var calories = ""
    @State private var food = ""
    
    @ObservedObject var foodlist:FoodList
    var body: some View {
        NavigationView{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .shadow(color:.gray,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 5)
                    .overlay {
                        TextField(caloriesTitle, text:$calories)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.center)
                    }
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300,height: 50)
                    .foregroundColor(.white)
                    .shadow(color:.gray,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 5)
                    .overlay {
                        TextField(foodTitle, text: $food)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.center)
                    }.padding()
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300,height: 50)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .overlay {
                        Button(action: {
                            if calories != ""  && food != ""{
                                foodlist.addCalories(food: food, calories: calories)
                                foodlist.showAddCaloriesView = false
                            }
                            else{
                                foodTitle  =  "enter these values"
                                caloriesTitle  = "enter these values"
                            }
                            
                            
                            
                        }, label: {
                            Text("Add").foregroundColor(.white)
                                .font(.title3)
                                .bold()
                                .fontWeight(.black)
                        })
                    }
                Spacer()
                
            }.navigationTitle("Add🍖")
                .padding(.top,35)
            
        }
    }
}
