//
//  ContentView.swift
//  Useless App
//
//  Created by klifton Cheng stu on 1/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                Image(systemName: "chart.line.downtrend.xyaxis")
            }
            
            SavedFactsView()
                .tabItem {
                Image(systemName: "wand.and.stars.inverse")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
