//
//  ShareButtonElement.swift
//  Useless App
//
//  Created by klifton Cheng stu on 2/7/23.
//

import SwiftUI

struct ShareButtonElement: View {
    
    let share: String
    
    var body: some View {
        VStack {
            ShareLink(item: share) {
                Image(systemName: "square.and.arrow.up")
                Text("Share Fact")
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ShareButtonElement_Previews: PreviewProvider {
    static var previews: some View {
        ShareButtonElement(share: "I want to share this fact")
    }
}
