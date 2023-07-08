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
        view.backgroundColor = .gray
        viewModel.isLoading.bind {value in
            self.content.loading(value)
        }
        viewModel.isApi.bind { value in
            self.content.configText(value)
            self.viewModel.isLoading.value = false
        }
        viewModel.getData()
    }
}
