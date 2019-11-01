//
//  ViewController.swift
//  AnimationTest2
//
//  Created by Edward O'Neill on 11/1/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        let titleLabel = UILabel()
        let bodyLabel = UILabel()
        
        fileprivate func setupLebel() {
    //        titleLabel.backgroundColor = .blue
    //        bodyLabel.backgroundColor = .lightGray
    //        titleLabel.textColor = .white
    //        bodyLabel.textColor = .white
            bodyLabel.numberOfLines = 0
            titleLabel.numberOfLines = 0
            titleLabel.text = "Welcome to Animation Test"
            titleLabel.font = UIFont(name: "Futura", size: 34)
            bodyLabel.text = "Hello there! Thanks for downloading my first animation testing application. Let me know if you find any bug on this app!"
        }
        
        fileprivate func setupStackView() {
            let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
            stackView.axis = .vertical
            stackView.spacing = 8
            view.addSubview(stackView)
            
            // enables auto layout
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupLebel()
            setupStackView()
            
            // fun animations
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
        }

        @objc fileprivate func handleTapAnimations() {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
            }) { (_) in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.titleLabel.alpha = 0
                    self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                })
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                  
                  self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                  
              }) { (_) in
                  UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                      self.bodyLabel.alpha = 0
                      self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                  })
              }
        }



}

