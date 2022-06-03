//
//  ItemView.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import SwiftUI

struct ItemView: View {
    @ObservedObject var item: ItemModel

    init(item: ItemModel) {
        _item = ObservedObject<ItemModel>(wrappedValue: item)
    }

    var body: some View {
        Text(item.name)
    }
}

struct ItemView_Previews: PreviewProvider {
    static let exampleItem = ItemModel(name: "Example Item")

    static var previews: some View {
        ItemView(item: exampleItem)
    }
}
