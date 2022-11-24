//
//  SheetyNavigationFlowSpy.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI
import NavigationFlow


class SheetyNavigationFlowSpy: SheetyNavigationFlow {
    
    enum SheetyIdentifier: Identifiable {
        
        var id: UUID { UUID() }
        
        case helloCruelWorld(String)
        case goodbyeHappyEarth(String)
    }
    
    
    @Published var modallyDisplayedView: SheetyIdentifier?
    
    init(modallyDisplayedView: SheetyIdentifier? = nil) {
        self.modallyDisplayedView = modallyDisplayedView
    }
    
    
    func displaySheet(for identifier: SheetyIdentifier) -> some View {
        
        Group {
            switch identifier {
            case let .helloCruelWorld(strDesc):
                Text(strDesc)
                
            case let .goodbyeHappyEarth(strDesc):
                let viewModel = SheetyNavigationFlowSpy(modallyDisplayedView: .helloCruelWorld(strDesc))
                
                SheetyNavigationView(sheetyNavigationViewModel: viewModel, content: Button(strDesc) { } )
            }
        }
    }
}
