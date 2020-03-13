//
//  HomeViewModelTest.swift
//  MobileMeetupTests
//
//  Created by Lucas César  Nogueira Fonseca on 12/03/20.
//  Copyright © 2020 Lucas César  Nogueira Fonseca. All rights reserved.
//

import XCTest
import Combine
import SwiftUI

@testable import MobileMeetup

class HomeViewModelTest: XCTestCase {

    /// Testes que não testam :

    func testViewModel() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        XCTAssertNotNil(viewModel.talksGrid)
    }

    func testClearLastTalks() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        viewModel.clearLastTalks()
        XCTAssertNotNil(viewModel)
    }

    func testDeleteLastAndSaveNew() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        viewModel.didSelectTalk("test 1")
        for index in 1...5 {
           viewModel.didSelectTalk("test \(index)")
        }
        XCTAssertNotNil(viewModel.$lastTalks)
    }

    func testTalkQueue() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 2)
        viewModel.didSelectTalk("1")
        viewModel.didSelectTalk("2")
        viewModel.didSelectTalk("3")
        XCTAssertFalse(viewModel.lastTalks.contains("1"))
        XCTAssertEqual(viewModel.lastTalks.last, "3")
    }

    func testTalkQueueUpdate() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 3)
        viewModel.didSelectTalk("1")
        viewModel.didSelectTalk("2")
        viewModel.didSelectTalk("3")
        viewModel.didSelectTalk("1")
        XCTAssertEqual(viewModel.lastTalks.last, "1")
    }
}
