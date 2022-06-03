//
//  AppState.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import Foundation

class AppState: ObservableObject {

    var items: [ItemModel]

    init() {
        self.items = []
    }

    @discardableResult func createNewItem(named: String) -> ItemModel {
        let item = ItemModel(name: named)
        objectWillChange.send()
        items.append(item)
        return item
    }
}

extension AppState {
    static func exampleState() -> AppState {
        let theState = AppState()
        
        let alice = theState.createNewItem(named: "Alice")
        let bob = theState.createNewItem(named: "Bob")
        theState.createNewItem(named: "Carol")
        theState.createNewItem(named: "Dave")
        theState.createNewItem(named: "Eleanor")
        theState.createNewItem(named: "Frank")
        theState.createNewItem(named: "Georgia")
        theState.createNewItem(named: "Hubert")
        theState.createNewItem(named: "Inez")
        theState.createNewItem(named: "Josh")
        theState.createNewItem(named: "Kim")
        theState.createNewItem(named: "Lou")
        theState.createNewItem(named: "May")
        theState.createNewItem(named: "Neil")
        theState.createNewItem(named: "Ophelia")
        theState.createNewItem(named: "Paul")

        alice.relate(to: bob)

        return theState
    }
}
