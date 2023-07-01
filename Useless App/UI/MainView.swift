//
//  ContentView.swift
//  Useless App
//
//  Created by klifton Cheng stu on 24/6/23.
//

import SwiftUI

struct MainView: View {
    
    @State var fact: String = "There is no current random fact"
    @State var link: String = ""
    @ObservedObject var factManager: FactManager = .shared
    
    var body: some View {
            VStack {
                
                Text(fact)
                    .padding(.horizontal)
                    .padding(20)
                    .background(.bar)
                    .cornerRadius(5)
                
                Button {
                    // fetch fact
                    decodeAPI { result, permalink  in
                        fact = result
                        link = permalink
                    }
                } label: {
                    Text("Generate Random Fact")
                        .padding()
                        .background(.pink)
                        .cornerRadius(5)
                }
                
                Button {
                    // Save Fact
                    factManager.facts.append(link)
                } label: {
                    Text("Save Fact")
                        .padding()
                        .background(.black)
                        .cornerRadius(5)
                    
                }
            }
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
