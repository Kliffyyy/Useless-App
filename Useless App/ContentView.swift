//
//  ContentView.swift
//  Useless App
//
//  Created by klifton Cheng stu on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var fact: String = "There is no current random fact"
    
    var body: some View {
        VStack {
            Text(fact)
            Button {
                // fetch fact
                decodeAPI { result in
                    fact = result
                }
            } label: {
                Text("Click Me")
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
