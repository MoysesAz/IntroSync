//
//  ViewController.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 02/07/23.
//

import UIKit

class ViewController: UIViewController {
    let content = ViewMain()
    let viewModel = ViewModel()

    override func loadView() {
        super.loadView()
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        setupDelegates()
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

