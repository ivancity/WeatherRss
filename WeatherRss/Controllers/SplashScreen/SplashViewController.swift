//
//  SplashViewController.swift
//  WeatherRss
//
//  Created by MC_test on 20/01/2017.
//  Copyright © 2017 MC_test. All rights reserved.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private let viewModel: SplashViewModel
    private let imageView: UIImageView =  UIImageView(image: #imageLiteral(resourceName: "img_splash"))
    
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
    
}

extension SplashViewController: SplashViewModelViewDelegate {
    func displayError(message: String) {
        //TODO show on Splash View some error message
        present(UIAlertController(message: message), animated: true)
    }
}

