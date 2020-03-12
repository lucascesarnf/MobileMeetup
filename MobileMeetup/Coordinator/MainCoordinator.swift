//
//  MainCoordinator.swift
//  MobileMeetup
//
//  Created by Lucas César  Nogueira Fonseca on 10/03/20.
//  Copyright © 2020 Lucas César  Nogueira Fonseca. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var homeViewController: UIViewController?
    var homeViewModel: HomeViewModel?
    var talks = ["Testes Automatizados", "Testes Unitários", "Android Developer", "Koin", "iOS Development", "Threads"]

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(setupHomeView(), animated: false)
    }

    func setupHomeView() -> UIViewController {
        let viewModel = HomeViewModel(talks: talks)
        let view = HomeView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        homeViewModel = viewModel
        homeViewController = viewController
        return viewController
    }
}
