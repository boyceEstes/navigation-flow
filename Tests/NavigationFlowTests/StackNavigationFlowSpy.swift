//
//  File.swift
//  
//
//  Created by Boyce Estes on 12/4/22.
//

import Foundation


import SwiftUI
import NavigationFlow


class StackNavigationFlowSpy: StackNavigationFlow {
    
    var path = [StackIdentifier]()
    
    enum StackIdentifier: Identifiable {
        
        var id: UUID { UUID() }
        
        case helloCruelWorld
    }
    
    
    func pushToStack(_ identifier: StackIdentifier) -> some View {
        return Text("Hello world")
    }
}
