//
//  ContentView.swift
//  Useless App
//
//  Created by klifton Cheng stu on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var fact: String = "There is no current random fact"
    @State var link: String = ""
    @ObservedObject var factManager: FactManager = .shared
    
    var body: some View {
        VStack {
            
            Text(fact)
            
            Button {
                // fetch fact
                decodeAPI { result, permalink  in
                    fact = result
                    link = permalink
                }
            } label: {
                Text("Click Me")
            }
            
            Button {
                // Save Fact
                factManager.facts.append(link)
            } label: {
                Text("save fact")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
