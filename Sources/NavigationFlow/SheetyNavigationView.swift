//
//  SheetyNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI
import ViewInspector


public struct SheetyNavigationView<Content: View, NavigationModalViewModel: SheetyNavigationFlow>: View {
    
    @ObservedObject var navigationModalViewModel: NavigationModalViewModel
    
    let content: Content
    
    
    public init(navigationModalViewModel: NavigationModalViewModel, content: Content) {
        self.navigationModalViewModel = navigationModalViewModel
        self.content = content
    }
    
    
    public var body: some View {
        
        content.sheet2(item: $navigationModalViewModel.modallyDisplayedView) { destination in
            
            // It actually doesn't matter where this came from,
            // we would just need to initialize this correctly from the root so that the modallyDisplayView navigationModalViewModel.displaySheet(for: destination)
            //
            // TODO: Get Presentation Indents from the viewModel if they are available
            navigationModalViewModel.displaySheet(for: destination)
        }
    }
}

