//
//  SheetyNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI
import ViewInspector


public struct SheetyNavigationView<Content: View, SheetyNavigationViewModel: SheetyNavigationFlow>: View {
    
    @ObservedObject var sheetyNavigationViewModel: SheetyNavigationViewModel
    
    let content: Content
    
    
    public init(sheetyNavigationViewModel: SheetyNavigationViewModel, content: Content) {
        self.sheetyNavigationViewModel = sheetyNavigationViewModel
        self.content = content
    }
    
    
    public var body: some View {
        
        content.sheet2(item: $sheetyNavigationViewModel.modallyDisplayedView) { destination in
            
            // It actually doesn't matter where this came from,
            // we would just need to initialize this correctly from the root so that the modallyDisplayView navigationModalViewModel.displaySheet(for: destination)
            //
            // TODO: Get Presentation Indents from the viewModel if they are available
            sheetyNavigationViewModel.displaySheet(for: destination)
        }
    }
}
