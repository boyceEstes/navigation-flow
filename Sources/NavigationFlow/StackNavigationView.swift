//
//  StackNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI


public struct StackNavigationView<Content: View, StackNavigationViewModel: StackNavigationFlow>: View {
    
    @ObservedObject var stackNavigationViewModel: StackNavigationViewModel
    
    let content: Content
    
    public init(stackNavigationViewModel: StackNavigationViewModel, content: Content) {
        self.stackNavigationViewModel = stackNavigationViewModel
        self.content = content
    }

    
    public var body: some View {
        
        NavigationStack(path: $stackNavigationViewModel.path) {
            content
                .navigationDestination(for: StackNavigationViewModel.StackIdentifier.self) { destination in
                    
                    stackNavigationViewModel.pushToStack(destination)
                }
        }
    }
}

