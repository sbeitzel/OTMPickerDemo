//
//  ItemModel.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import Foundation
import OrderedCollections

class ItemModel: ObservableObject, Identifiable {
    let id: String

    private var storedName: String
    var relatedItems: OrderedSet<ItemModel>

    var name: String {
        get { storedName }
        set {
            objectWillChange.send()
            storedName = newValue
        }
    }

    init(name: String) {
        self.id = UUID().uuidString
        self.storedName = name
        self.relatedItems = OrderedSet<ItemModel>()
    }

    func relate(to other: ItemModel) {
        addRelation(other)
        other.addRelation(self)
    }

    fileprivate func addRelation(_ other: ItemModel) {
        objectWillChange.send()
        relatedItems.append(other)
    }

    func unrelate(from other: ItemModel) {
        removeRelation(other)
        other.removeRelation(self)
    }

    fileprivate func removeRelation(_ other: ItemModel) {
        objectWillChange.send()
        relatedItems.remove(other)
    }
}

extension ItemModel: Hashable, Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
