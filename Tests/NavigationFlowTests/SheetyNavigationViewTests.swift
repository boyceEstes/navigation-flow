//
//  SheetyNavigationViewTests.swift
//  NavigationFlowDemoTests
//
//  Created by Boyce Estes on 11/17/22.
//

import XCTest
import SwiftUI
import NavigationFlow
import ViewInspector

extension SheetyNavigationView: Inspectable { }
extension InspectableSheetWithItem: ItemPopupPresenter { }


/// This is testing to make sure that our SheetyNavigationView will work in any context.
/// We want to make sure that the sheet modifier is attached and that the screen being
/// displayed directly correlates to the object that is provided in the associated viewmodel
final class SheetyNavigationViewTests: XCTestCase {
    
    func test_sheetyNavigationView_createdWithAnyViewContent_hasSheetModifier() {
        
        // given/when
        let anyView = Text("Any")
        
        // when
        let viewModel = SheetyNavigationFlowSpy(modallyDisplayedView: .helloCruelWorld("any"))
        let sheetyNavigationView = SheetyNavigationView(sheetyNavigationViewModel: viewModel, content: anyView)
        
        // then
        XCTAssertNoThrow(try sheetyNavigationView.inspect().text().sheet())
    }
    
    
    func test_sheetyNavigationView_sheetWithNoModallyDisplayedView_hasNoSheetDisplayed() {
        
        // given
        let anyView = Text("Any")
        
        // when
        let viewModel = SheetyNavigationFlowSpy()
        let sheetyNavigationView = SheetyNavigationView(sheetyNavigationViewModel: viewModel, content: anyView)
        
        // then
        XCTAssertThrowsError(try sheetyNavigationView.inspect().text().sheet())
    }
    
    
    func test_sheetyNavigationView_sheetWithModalIdentifierSet_showsCorrespondingViewInSheet() throws {
        
        // given
        let anyView = Text("Any")
        let expectedSheetText = "Hello Cruel World"
        
        // when
        let viewModel = SheetyNavigationFlowSpy(modallyDisplayedView: .helloCruelWorld(expectedSheetText))
        let sheetyNavigationView = SheetyNavigationView(sheetyNavigationViewModel: viewModel, content: anyView)
        
        // then
        let sheet = try sheetyNavigationView.inspect().text().sheet()
        let sheetText = try sheet.group().text(0).string()
        XCTAssertEqual(sheetText, expectedSheetText)
    }
    
    
    func test_sheetyNavigationView_sheetWithModalIdentifierSetTwice_showsCorrespondingViewInSheet() throws {
        
        // given/when
        let textView = Text("Any")
        let expectedSheetText = "Hello Cruel World"
        let viewModel = SheetyNavigationFlowSpy(modallyDisplayedView: .goodbyeHappyEarth(expectedSheetText))
        let sheetyNavigationView1 = SheetyNavigationView(sheetyNavigationViewModel: viewModel, content: textView)

        // then
        let sheet1 = try sheetyNavigationView1.inspect().text().sheet()
        let sheet1Button = try sheet1.find(button: expectedSheetText)
        let sheet2 = try sheet1Button.sheet()
        let sheet2Text = try sheet2.group().text(0).string()
        
        XCTAssertEqual(sheet2Text, expectedSheetText)
    }
}


