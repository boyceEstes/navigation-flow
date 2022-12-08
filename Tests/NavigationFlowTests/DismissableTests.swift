//
//  DismissableTests.swift
//  
//
//  Created by Boyce Estes on 12/4/22.
//

import XCTest

final class DismissableTests: XCTestCase {

    
    func test_dismissable_dismissWithSheetDisplayed_setsSheetDisplayedToNil() {

        // given
        let sut = SheetyNavigationFlowSpy()
        sut.modallyDisplayedView = .goodbyeHappyEarth("Any")

        // when
        sut.dismiss()

        // then
        XCTAssertNil(sut.modallyDisplayedView)
    }
    
    
    func test_dismissable_dismissWithNoSheetDisplayed_noSideEffects() {

        // given
        let sut = SheetyNavigationFlowSpy()
        sut.modallyDisplayedView = nil

        // when
        sut.dismiss()

        // then
        XCTAssertNil(sut.modallyDisplayedView)
    }
    
    
    func test_dismissable_dismissWithNonEmptyStack_popsTopOffTheStack() {
        
        // given
        let sut = StackNavigationFlowSpy()
        sut.path = [.helloCruelWorld]

        // when
        sut.dismiss()

        // then
        XCTAssertEqual(sut.path, [])
    }
    
    
    func test_dismissable_dismissWithEmptyStack_noSideEffects() {
        
        // given
        let sut = StackNavigationFlowSpy()
        sut.path = []

        // when
        sut.dismiss()

        // then
        XCTAssertEqual(sut.path, [])
    }
    
    
    func test_dismissable_dismissWithModalDisplayedAndNonEmptyStack_setsSheetdisplayedToNil() {
        
        // given
        let sut = SheetyStackNavigationFlowSpy()
        sut.path = [.helloCruelWorld]
        sut.modallyDisplayedView = .goodbyeHappyEarth("any")

        // when
        sut.dismiss()

        // then
        XCTAssertEqual(sut.path, [.helloCruelWorld])
        XCTAssertNil(sut.modallyDisplayedView)
    }
    
    
    func test_dismissable_dismissWithModalNotDisplayedAndNonEmptyStack_popsLastStackView() {
        
        // given
        let sut = SheetyStackNavigationFlowSpy()
        sut.path = [.helloCruelWorld]
        sut.modallyDisplayedView = nil//.goodbyeHappyEarth("any")

        // when
        sut.dismiss()

        // then
        XCTAssertEqual(sut.path, [])
        XCTAssertNil(sut.modallyDisplayedView)
    }
}


//final class PotionNavigationViewModelTests: XCTestCase {
//
//    func test_dismissWithModalDisplayedAndStackNonEmpty_setsSheetDisplayedToNil() {
//
//        // given
//        let sut = makeSUT()
//        sut.path = [.brewPotion(stirsToCompletion: 0)]
//        sut.modallyDisplayedView = .potionHelp
//
//        // when
//        sut.dismiss()
//
//        // then
//        XCTAssertNil(sut.modallyDisplayedView)
//    }
//
//
//    func test_dismissWithModalDisplayedAndEmptyStack_setsSheetDisplayedToNil() {
//
//        // given
//        let sut = makeSUT()
//        sut.path = []
//        sut.modallyDisplayedView = .potionHelp
//
//        // when
//        sut.dismiss()
//
//        // then
//        XCTAssertNil(sut.modallyDisplayedView)
//    }
//
//
//    func test_dismissWithModalNotDisplayedAndStackNonEmpty_popsTopOfTheStack() {
//
//        // given
//        let sut = makeSUT()
//        sut.path = [.brewPotion(stirsToCompletion: 0)]
//        sut.modallyDisplayedView = nil
//
//        // when
//        sut.dismiss()
//
//        // then
//        XCTAssertEqual(sut.path, [])
//    }
//
//
//    func test_dismissWithModalNotDisplayedAndStackEmpty_doesNotModifyPath() {
//
//        // given
//        let sut = makeSUT()
//        sut.path = []
//        sut.modallyDisplayedView = nil
//
//        // when
//        sut.dismiss()
//
//        // then
//        XCTAssertEqual(sut.path, [])
//    }
//
//
//    func test_dismissWithModalNotDisplayedAndStackEmpty_doesNotModifySheetDisplayed() {
//
//        // given
//        let sut = makeSUT()
//        sut.path = []
//        sut.modallyDisplayedView = nil
//
//        // when
//        sut.dismiss()
//
//        // then
//        XCTAssertNil(sut.modallyDisplayedView)
//    }
//
//
//    // MARK: - Helpers
//    func makeSUT() -> PotionNavigationViewModel {
//        return PotionNavigationViewModel()
//    }
//}
