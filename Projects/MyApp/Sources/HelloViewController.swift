//
//  HelloViewController.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit
import MyServices

final class HelloViewController: UIViewController {
  private let helloService: HelloServiceProtocol

  let label: UILabel = UILabel()

  init(helloService: HelloServiceProtocol) {
    self.helloService = helloService
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(self.label)
    self.setupConstraints()
    self.fetchGreetingMessage()
  }

  private func setupConstraints() {
    self.label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }

  private func fetchGreetingMessage() {
    self.label.text = self.helloService.hello()
  }
}
