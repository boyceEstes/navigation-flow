//
//  SheetyStackNavigationFlowSpy.swift
//  
//
//  Created by Boyce Estes on 12/5/22.
//

import Foundation
import NavigationFlow
import SwiftUI

class SheetyStackNavigationFlowSpy: SheetyNavigationFlow, StackNavigationFlow, Dismissable {
    
    @Published var modallyDisplayedView: SheetyIdentifier?
    var path = [StackIdentifier]()
    
    enum StackIdentifier: Identifiable {
        
        var id: UUID { UUID() }
        
        case helloCruelWorld
    }
    
    
    enum SheetyIdentifier: Identifiable {
        
        var id: UUID { UUID() }
        
        case helloCruelWorld(String)
        case goodbyeHappyEarth(String)
    }
    
    
    func pushToStack(_ identifier: StackIdentifier) -> some View {
        return Text("Hello world")
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
