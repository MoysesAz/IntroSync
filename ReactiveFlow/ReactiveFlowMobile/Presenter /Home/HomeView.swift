//
//  View.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 04/07/23.
//

import UIKit

class HomeView: UIView {
    lazy var text: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 16)
        text.textAlignment = .center
        text.backgroundColor = .white
        text.textColor = .black
        return text
    }()

    lazy var buttonSync: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Sync", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonSyncEvent), for: .touchUpInside)
        return button
    }()

    lazy var buttonAsync: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("Async", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonAsyncEvent), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    lazy var loading: UIActivityIndicatorView = {
        let loading =  UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()

    var delegate: HomeViewModelDelegate?


    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        backgroundColor = .systemGray6
        setupSubViews()
        setupConstraint()
    }

}



extension HomeView {
    @objc func buttonSyncEvent() {
        let value = delegate?.responseSync()
        text.text = value?.first!
    }
    

    @objc func buttonAsyncEvent() {
        delegate?.getDataInApi()
    }

    func configText(_ value: [String]?) {
        if value != nil {
            self.text.text = value?.first
        }
    }

    func loading(_ value: Bool?) {
        guard let value else {
            return
        }

        if value {
            DispatchQueue.main.async {
                self.text.isHidden = true
                self.loading.isHidden = false
                self.loading.startAnimating()
            }
        } else {
            DispatchQueue.main.async {
                self.text.isHidden = false
                self.loading.startAnimating()
                self.loading.isHidden = true
            }
        }

    }
}

extension HomeView {
    func setupSubViews() {
        addSubview(text)
        addSubview(buttonSync)
        addSubview(buttonAsync)
        addSubview(loading)
    }
}


extension HomeView {
    func setupConstraint() {
        textConstraints()
        buttonSyncConstraints()
        buttonAsyncConstraints()
        loadingConstraints()
    }

    func textConstraints() {
        NSLayoutConstraint.activate(
            [
                text.centerXAnchor.constraint(equalTo: centerXAnchor),
                text.centerYAnchor.constraint(equalTo: centerYAnchor),
                text.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
                text.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            ]
        )
    }

    func buttonSyncConstraints() {
        NSLayoutConstraint.activate(
            [
                buttonSync.rightAnchor.constraint(equalTo: centerXAnchor, constant: -5),
                buttonSync.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 50),
                buttonSync.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
                buttonSync.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            ]
        )
    }

    func buttonAsyncConstraints() {
        NSLayoutConstraint.activate(
            [
                buttonAsync.leftAnchor.constraint(equalTo: centerXAnchor, constant: 5),
                buttonAsync.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 50),
                buttonAsync.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
                buttonAsync.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            ]
        )
    }


    func loadingConstraints() {
        NSLayoutConstraint.activate(
            [
                loading.centerXAnchor.constraint(equalTo: centerXAnchor),
                loading.centerYAnchor.constraint(equalTo: centerYAnchor),
                loading.heightAnchor.constraint(equalTo: heightAnchor),
                loading.widthAnchor.constraint(equalTo: widthAnchor),
            ]
        )
    }
}


