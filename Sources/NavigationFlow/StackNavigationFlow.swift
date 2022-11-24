//
//  NavigationStackFlow.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

public protocol StackNavigationFlow: ObservableObject {
    
    associatedtype StackIdentifier: Hashable
    associatedtype SomeStackView: View
    
    var path: [StackIdentifier] { get set }
    
    func pushToStack(_ identifier: StackIdentifier) -> SomeStackView
}
