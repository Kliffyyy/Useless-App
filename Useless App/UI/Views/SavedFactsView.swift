//
//  SavedFactsView.swift
//  Useless App
//
//  Created by klifton Cheng stu on 1/7/23.
//

import SwiftUI

struct SavedFactsView: View {
    
    @ObservedObject var factManager: FactManager = .shared
    @State private var fact = ""
    
    var body: some View {
        List {
            ForEach(factManager.facts, id: \.self) { fact in
                Menu {
                    ShareButtonElement(share: fact)
                } label: {
                    Text(fact)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
            }
            .onDelete { i in
                factManager.facts.remove(atOffsets: i)
            }
        }
    }
}

struct SavedFactsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedFactsView()
    }
}
