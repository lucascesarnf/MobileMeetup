//
//  HomeViewModel.swift
//  MobileMeetup
//
//  Created by Lucas César  Nogueira Fonseca on 10/03/20.
//  Copyright © 2020 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var lastTalks: [String] = []
    var talksGrid: [[String]] = [[]]
    private var talks: [String]
    private let talksColumnsNumer = 3
    private let limitOfTalks = 6

    init(talks: [String]) {
        self.talks = talks
        setupTalksGrid()
    }

    func clearLastTalks() {
        lastTalks = []
    }

    func didSelectTalk(_ talk: String) {
        if lastTalks.contains(talk) {
            updateTalk(talk)
        } else {
            if lastTalks.count < limitOfTalks {
                lastTalks.append(talk)
            } else {
               deleteLastAndSaveNew(talk)
            }
        }
    }
}

private extension HomeViewModel {
    func deleteLastAndSaveNew(_ talk: String) {
        lastTalks.removeFirst()
        lastTalks.append(talk)
    }

    func updateTalk(_ talk: String) {
        guard let index = lastTalks.firstIndex(of: talk) else { return }
        lastTalks.remove(at: index)
        lastTalks.append(talk)
    }

    func setupTalksGrid() {
        var grid = [[String]]()
        var count = 0

        for line in 0 ..< talksColumnsNumer {
            var array = [String]()
            for column in 0 ..< talksColumnsNumer {
                count = line * talksColumnsNumer + column
                if talks.indices.contains(count) {
                    array.append(talks[count])
                }
                count += 1
            }
            if array.count > 0 {
                grid.append(array)
            }
        }
        talksGrid = grid
    }
}
