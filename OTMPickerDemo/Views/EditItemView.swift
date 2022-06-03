//
//  EditItemView.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import SwiftUI

struct EditItemView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var item: ItemModel

    @State var nameString: String

    init(item: ItemModel) {
        _item = ObservedObject<ItemModel>(wrappedValue: item)
        _nameString = State(wrappedValue: item.name)
    }

    var body: some View {
        let nameBinding = $nameString.onChange {
            item.name = nameString
        }

        return Form {
            Section("Name") {
                TextField("Item name", text: nameBinding)
            }
            Section("Related Items") {
                List(item.relatedItems) { otherItem in
                    RemovableItemView(item: otherItem,
                                      handler: { item.unrelate(from: otherItem) })
                }
            }
        }
    }
}

struct EditItemView_Previews: PreviewProvider {
    static let exampleState: AppState = AppState.exampleState()

    static var previews: some View {
        EditItemView(item: exampleState.items.first!)
            .environmentObject(exampleState)
    }
}
