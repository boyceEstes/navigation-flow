//
//  StackNavigationView.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI


struct StackNavigationView<Content: View, NavigationStackViewModel: StackNavigationFlow>: View {
    
    @ObservedObject var navigationStackViewModel: NavigationStackViewModel
    let rootView: Content
    
    var body: some View {
        
        NavigationStack(path: $navigationStackViewModel.path) {
            rootView
                .navigationDestination(for: NavigationStackViewModel.StackNavigationIdentifier.self) { destination in
                    
                    navigationStackViewModel.pushToStack(destination)
                }
        }
    }
}

