//
//  NavigationSheetFlow.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

public protocol SheetyNavigationFlow: ObservableObject {
    
    associatedtype SheetyIdentifier: Identifiable
    associatedtype SomeSheetView: View
    
    var modallyDisplayedView: SheetyIdentifier? { get set }
    
    func displaySheet(for identifier: SheetyIdentifier) -> SomeSheetView
}
