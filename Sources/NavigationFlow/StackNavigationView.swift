//
//  StackNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI


public struct StackNavigationView<Content: View, NavigationStackViewModel: StackNavigationFlow>: View {
    
    @ObservedObject var navigationStackViewModel: NavigationStackViewModel
    
    let content: Content
    
    public init(navigationStackViewModel: NavigationStackViewModel, content: Content) {
        self.navigationStackViewModel = navigationStackViewModel
        self.content = content
    }

    
    public var body: some View {
        
        NavigationStack(path: $navigationStackViewModel.path) {
            content
                .navigationDestination(for: NavigationStackViewModel.StackIdentifier.self) { destination in
                    
                    navigationStackViewModel.pushToStack(destination)
                }
        }
    }
}

