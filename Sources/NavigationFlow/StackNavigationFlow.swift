//
//  NavigationStackFlow.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

protocol StackNavigationFlow: ObservableObject {
    
    associatedtype StackNavigationIdentifier: Hashable
    associatedtype SomeView: View
    
    var path: [StackNavigationIdentifier] { get set }
    
    func pushToStack(_ identifier: StackNavigationIdentifier) -> SomeView
}
