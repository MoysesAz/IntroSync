//
//  View.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 04/07/23.
//

import UIKit

class ViewMain: UIView {
    lazy var text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .red
        return text
    }()

    lazy var loading: UIActivityIndicatorView = {
        let loading =  UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()


    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        setupSubViews()
        setupConstraint()
    }
}

extension ViewMain {
    func setupSubViews() {
        addSubview(text)
        addSubview(loading)
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


extension ViewMain {
    func setupConstraint() {
        textConstraints()
        loadingConstraints()
    }

    func textConstraints() {
        NSLayoutConstraint.activate(
            [
                text.centerXAnchor.constraint(equalTo: centerXAnchor),
                text.centerYAnchor.constraint(equalTo: centerYAnchor),
                text.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
                text.widthAnchor.constraint(equalTo: widthAnchor),
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


