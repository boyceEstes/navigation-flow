//
//  File.swift
//  
//
//  Created by Boyce Estes on 12/7/22.
//

import Foundation

///
/// Includes Dismissable protocol conformance, `dismiss()`-
/// when dismiss is called, if a sheet is displayed, it will be dismissed
/// otherwise the last view in the stack will be popped
///
public protocol SheetyStackNavigationFlow: SheetyNavigationFlow, StackNavigationFlow { }


public extension Dismissable where Self: StackNavigationFlow, Self: SheetyNavigationFlow {

    func dismiss() {
        
        if modallyDisplayedView != nil {
            modallyDisplayedView = nil
        } else {
            let _ = path.popLast()
        }
    }
}
