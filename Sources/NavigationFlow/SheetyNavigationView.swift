//
//  SheetyNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

public struct SheetyNavigationView<Content: View, SheetyNavigationViewModel: SheetyNavigationFlow>: View {
    
    @ObservedObject var sheetyNavigationViewModel: SheetyNavigationViewModel
    
    let content: Content
    let onDismiss: (() -> Void)?
    
    
    public init(
        sheetyNavigationViewModel: SheetyNavigationViewModel,
        content: Content,
        onDismiss: (() -> Void)?
    ) {
        self.sheetyNavigationViewModel = sheetyNavigationViewModel
        self.content = content
        self.onDismiss = onDismiss
    }
    
    
    public var body: some View {
        
        content.sheet2(item: $sheetyNavigationViewModel.modallyDisplayedView, onDismiss: onDismiss) { destination in
            
            // It actually doesn't matter where this came from,
            // we would just need to initialize this correctly from the root so that the modallyDisplayView navigationModalViewModel.displaySheet(for: destination)
            //
            // TODO: Get Presentation Indents from the viewModel if they are available
            sheetyNavigationViewModel.displaySheet(for: destination)
        }
    }
}
