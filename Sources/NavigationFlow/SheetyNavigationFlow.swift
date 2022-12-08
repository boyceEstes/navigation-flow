//
//  NavigationSheetFlow.swift
//  
//
//  Created by Boyce Estes on 11/22/22.
//

import SwiftUI

///
/// Includes Dismissable protocol conformance, `dismiss()`-
/// when it is called, the displayed view will be removed/dismissed
///
public protocol SheetyNavigationFlow: ObservableObject, Dismissable {
    
    associatedtype SheetyIdentifier: Identifiable
    associatedtype SomeSheetView: View
    
    var modallyDisplayedView: SheetyIdentifier? { get set }
    
    func displaySheet(for identifier: SheetyIdentifier) -> SomeSheetView
}


public extension Dismissable where Self: SheetyNavigationFlow {
    
    func dismiss() {
        self.modallyDisplayedView = nil
    }
}
