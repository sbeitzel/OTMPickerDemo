//
//  ContentView.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState: AppState = AppState()

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { appState.createNewItem(named: "A new item")},
                       label: { Label("Add Item", systemImage: "plus.rectangle") })
            }
            Group {
                if appState.items.isEmpty {
                    Text("No items. Why not add a few?")
                        .padding()
                } else {
                    List(appState.items) { item in
                        ItemView(item: item)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
