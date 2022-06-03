//
//  RemovableItemView.swift
//  OTMPickerDemo
//
//  Created by Stephen Beitzel on 6/3/22.
//

import SwiftUI

struct RemovableItemView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject var item: ItemModel
    let removeHandler: () -> Void

    init(item: ItemModel, handler: @escaping () -> Void) {
        _item = StateObject<ItemModel>(wrappedValue: item)
        self.removeHandler = handler
    }

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Image(systemName: "x.circle")
        }
        .onTapGesture {
            removeHandler()
            presentationMode.wrappedValue.dismiss()
        }
        .padding()
        .background(Color.secondary.opacity(0.4))
    }
}

struct RemovableItemView_Previews: PreviewProvider {
    static let exampleItem = ItemModel(name: "Example item")

    static var previews: some View {
        RemovableItemView(item: exampleItem, handler: {})
    }
}
