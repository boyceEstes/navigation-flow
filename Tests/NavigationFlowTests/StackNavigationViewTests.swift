//
//  StackNavigationFlowTests.swift
//  
//
//  Created by Boyce Estes on 12/4/22.
//

import XCTest
import SwiftUI
import NavigationFlow
import ViewInspector



/// This is testing to make sure that our StackNavigationView will work in any context.
/// We want to make sure that the NavigationStack view with the stackDestination modifier
/// is attached and that the screen being displayed directly correlates to the object that is
/// provided in the associated viewmodel
///
///
/// Have NOT created the tests yet because I'm not sure the best way to go about testing that
/// the view has navigationDestination and NavigationStack
final class StackNavigationViewTests: XCTestCase {

    func test_stackNavigationView_createdWithAnyViewContent_hasStackDestinationModifier() {}
        
        
    func test_stackNavigationView_emptyPath_hasNothingPushed() {}


    func test_stackNavigationView_pathWithOneElement_showsCorrespondingViewInStackHierarchy() throws {}


    func test_stackNavigationView_pathWithTwoElements_showsCorrespondingViewsInStackHierarchyInOrder() throws {}
}
