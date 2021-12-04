//
//  ContentView.swift
//  SwiftAlgorithm
//
//  Created by xunruan on 2021-12-03.
//

import SwiftUI
import Algorithms

struct ContentView: View {
    var testing = Testing()
    var body: some View {
        //        List(testing.chainTwoArrays(arr1: testing.name1, arr2: testing.name2), id: \.self) { element in
        //            Text(element)
        //        }
        //            .padding()
        Text("?")
            .onAppear {
                //                testing.chunk()
//                testing.uniqued()
//                testing.Product()
                testing.window()
            }
    }
}

class Testing {
    let name1 = ["apple", "banana"]
    let name2 = ["cat", "dog"]
    
    func chainTwoArrays(arr1: [String], arr2: [String]) -> [String] {
        return Array<String>(chain(arr1, arr2))
    }
    
    func chunk() {
        struct Company {
            let name: String
            let level: String
        }
        
        let companies: [Company] = [
            .init(name: "Apple", level: "A"),
            .init(name: "Samsung", level: "A"),
            .init(name: "Xiaomi", level: "B"),
            .init(name: "Oppo", level: "B"),
            .init(name: "Xiaolajiao", level: "D")
        ]
        
        let companiesByLevel = companies.chunked(on: \.level)
        for (level, companies) in companiesByLevel {
            print("\(level) level: \n")
            for company in companies {
                print(company.name)
            }
            print("")
        }
        
        let pairs = companies.chunks(ofCount: 2)
        for pair in pairs {
            let names = ListFormatter.localizedString(byJoining: pair.map(\.name))
            print(names)
        }
    }
    
    func randomSample() {
        let lotteryBall = 1...50
        var lottery = lotteryBall.randomSample(count: 7)
        lottery = lotteryBall.randomStableSample(count: 7)
        print(lottery)
    }
    
    func uniqued() {
        let itemsOnDesk = ["orange", "water", "orange", "Phone"]
        let uniqueItems = itemsOnDesk.uniqued()
        for item in uniqueItems {
            print(item)
        }
        
        struct City {
            var name: String
            var country: String
        }
        
        let cities: [City] = [
            .init(name: "kyoto", country: "Japan"),
            .init(name: "osaka", country: "Japan"),
            .init(name: "naples", country: "Italy"),
            .init(name: "Florence", country: "Italy"),
            .init(name: "Hamburg", country: "Germany")
        ]
        
        let selectedCities = cities.uniqued(on: \.country)
        for city in selectedCities {
            print("Visit \(city.name) in \(city.country)")
        }
    }
    
    func Product() {
        let appleProducts = ["iPhone 13", "iPhone 12"]
        let samsungProducts = ["Galaxy S11", "Galaxy Tab A7"]
        let aspects = ["Battery Life", "Screen Quality"]
        let titles = product(product(appleProducts, samsungProducts), aspects)
        for title in titles {
            print("Which is better in terms of \(title.1)? \(title.0.0) or \(title.0.1)")
        }
    }
    
    func window() {
        let items = (1...100).windows(ofCount: 5)
        for item in items {
            let strings = item.map(String.init)
            print(ListFormatter.localizedString(byJoining: strings))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
