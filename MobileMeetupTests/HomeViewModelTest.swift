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

    /// Testes que `NÃO` testam mas dão 100% de coverage :
    func testViewModel() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        XCTAssertNotNil(viewModel.talksGrid)
    }

    func testClearLastTalks() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        viewModel.clearLastTalks()
    }

    func testSelectTalk() {
        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
        viewModel.didSelectTalk("1")
        viewModel.didSelectTalk("1")
        viewModel.didSelectTalk("2")
        viewModel.didSelectTalk("3")
    }

    /// Testes que `TESTAM` :
//    func testDeleteLastAndSaveNew() {
//        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 2)
//        viewModel.didSelectTalk("1")
//        viewModel.didSelectTalk("2")
//        viewModel.didSelectTalk("1")
//        XCTAssertEqual(viewModel.lastTalks.count , 2)
//    }
//
//    func testTalkQueue() {
//        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 2)
//        viewModel.didSelectTalk("1")
//        viewModel.didSelectTalk("2")
//        viewModel.didSelectTalk("3")
//        XCTAssertFalse(viewModel.lastTalks.contains("1"))
//        XCTAssertEqual(viewModel.lastTalks.last, "3")
//    }
//
//    func testTalkQueueUpdate() {
//        let viewModel = HomeViewModel(talks: [""], limitOfTalks: 3)
//        viewModel.didSelectTalk("1")
//        viewModel.didSelectTalk("2")
//        viewModel.didSelectTalk("3")
//        viewModel.didSelectTalk("1")
//        XCTAssertEqual(viewModel.lastTalks.last, "1")
//    }
//    
//    func testClearLastTalks() {
//         let viewModel = HomeViewModel(talks: [""], limitOfTalks: 1)
//        viewModel.didSelectTalk("1")
//        XCTAssertEqual(viewModel.lastTalks[0], "1")
//        viewModel.clearLastTalks()
//        XCTAssertTrue(viewModel.lastTalks.isEmpty)
//    }
}
