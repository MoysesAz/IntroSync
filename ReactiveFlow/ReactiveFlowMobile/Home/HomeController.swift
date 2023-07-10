//
//  ViewController.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 02/07/23.
//

import UIKit

class HomeController: UIViewController {
    let content = HomeView()
    let viewModel = HomeViewModel()

    override func loadView() {
        super.loadView()
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupDelegates()
        setupBinders()
    }

    private func setupDelegates() {
        content.delegate = viewModel
    }

    private func setupBinders() {
        viewModel.isApi.bind(content.configText)
        viewModel.isLoading.bind(content.loading)
    }
}

