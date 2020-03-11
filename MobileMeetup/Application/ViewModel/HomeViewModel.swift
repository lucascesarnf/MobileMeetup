//
//  HomeViewModel.swift
//  MobileMeetup
//
//  Created by Lucas César  Nogueira Fonseca on 10/03/20.
//  Copyright © 2020 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var talksGrid: [[String]] = [[]]
    private var talks: [String]
    private let numberOfTalks = 8
    private let talksColumnsNumer = 3
    private let limitOfTalks = 8
    
    init(talks: [String]) {
        self.talks = talks
        setupTalksGrid()
    }
    
    func didSelectTalk(_ talk: Talk) {
        
    }
    
    func businessLogic() {
        // When my talks reaches 4, the first one needs to be deleted and the last one added last.
        
    }
    
    func computeSomething() {
        
    }
    
    func doSomething() {
        
    }
    
    private func setupTalksGrid() {
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