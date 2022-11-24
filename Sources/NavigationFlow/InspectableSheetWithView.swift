//
//  File.swift
//  
//
//  Created by Boyce Estes on 11/23/22.
//

import SwiftUI

///
/// Test that we are actually have this sheet modifier appended to the view and will
/// modify the item in the view-model appropriately
///
public extension View {
    
    func sheet2<Item: Identifiable, Sheet: View>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        content: @escaping (Item) -> Sheet
    ) -> some View {
        
        return self.modifier(
            InspectableSheetWithItem(
                item: item,
                onDismiss: onDismiss,
                popupBuilder: content)
        )
    }
}


public struct InspectableSheetWithItem<Item, Sheet>: ViewModifier where Item: Identifiable, Sheet: View {
    
    public let item: Binding<Item?>
    public let onDismiss: (() -> Void)?
    public let popupBuilder: (Item) -> Sheet
    
    public func body(content: Self.Content) -> some View {
        content.sheet(item: item, onDismiss: onDismiss, content: popupBuilder)
    }
}
