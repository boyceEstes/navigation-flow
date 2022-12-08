//
//  NavigationStackFlow.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

///
/// Includes Dismissable protocol conformance, `dismiss()`-
/// when it is called, the last path view will be removed/dismissed
///
public protocol StackNavigationFlow: ObservableObject, Dismissable {
    
    associatedtype StackIdentifier: Hashable
    associatedtype SomeStackView: View
    
    var path: [StackIdentifier] { get set }
    
    func pushToStack(_ identifier: StackIdentifier) -> SomeStackView
}


public extension Dismissable where Self: StackNavigationFlow {

    func dismiss() {
        let _ = self.path.popLast()
    }
}
