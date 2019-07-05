//
//  ViewController.swift
//  basicAnimation-practice
//
//  Created by Dongwoo Pae on 7/3/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var label: UILabel!
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLabel()
        //self.configureRedView()
        self.configureButtons()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //This ensures that the label is centered on the screen to start
        self.label.center = self.view.center
    }
    
    
    func configureRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false  // to use programmtic constraints
        
        // Add it to the view controller's view
        
        self.view.addSubview(redView)
        
        // Constrain it
        // NSLayoutConstraint API   constant is for margin
//        let redLeadingConstraint = NSLayoutConstraint(item: redView,
//                                                        attribute: .leading,
//                                                        relatedBy: .equal,
//                                                        toItem: view.safeAreaLayoutGuide,
//                                                        attribute: .leading,
//                                                        multiplier: 1,
//                                                        constant: 30)
//
//        let redBottomConstraint = NSLayoutConstraint(item: redView,
//                                                       attribute: .bottom,
//                                                       relatedBy: .equal,
//                                                       toItem: view.safeAreaLayoutGuide,
//                                                       attribute: .bottom,
//                                                       multiplier: 1,
//                                                       constant: 0)
//
//        let redHeightConstraint = NSLayoutConstraint(item: redView,
//                                                       attribute: .height,
//                                                       relatedBy: .equal,
//                                                       toItem: nil,
//                                                       attribute: .notAnAttribute,
//                                                       multiplier: 1,
//                                                       constant: 100)  //Is this assigning redView's height to 100?
//
//        let redAspectRatioConstraints = NSLayoutConstraint(item: redView,
//                                                           attribute: .width,
//                                                           relatedBy: .equal,
//                                                           toItem: redView,
//                                                           attribute: .height,
//                                                           multiplier: 1,
//                                                           constant: 0)
//
//        NSLayoutConstraint.activate(
//            [
//                redLeadingConstraint,
//                redBottomConstraint,
//                redHeightConstraint,
//                redAspectRatioConstraints
//            ]
//        )
        
        // NOTE: - These are the same constraints as above
        let redLeadingConstraint = redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let redBottomConstraint = redView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let redHeightConstraint = redView.heightAnchor.constraint(equalToConstant: 100.0)
        let redViewAspectRatioConstraint = redView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate(
                    [
                        redLeadingConstraint,
                        redBottomConstraint,
                        redHeightConstraint,
                        redViewAspectRatioConstraint
                    ]
                )
        
    }
    
    func configureLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true  //giving size of width to be equal to height
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 12
        label.layer.borderColor = UIColor.cyan.cgColor
        
        label.text = "🏀"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
    }
    
    func configureButtons() {
        let rotateButton = UIButton(type: .system)
        rotateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotateButton)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyButton)
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(springButton)
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let squashButton = UIButton(type: .system)
        squashButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotateButton)
        squashButton.setTitle("Squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        
        let anticButton = UIButton(type: .system)
        anticButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(anticButton)
        anticButton.setTitle("Antic", for: .normal)
        anticButton.addTarget(self, action: #selector(anticButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(squashButton)
        stackView.addArrangedSubview(anticButton)
        
        NSLayoutConstraint.activate(
            [
                stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            ]
        )
    }
    
    
    // MARK: - Actions and Animations
    @objc func rotateButtonTapped() {
        UIView.animate(withDuration: 1.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.label.transform = .identity
            })
        }
    }
    
    @objc func keyButtonTapped() {
        label.center = self.view.center
        
        //customization depending on duration creating animation frame
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            //relativeStartTime = when to start first: 0.0 second: 0.25 third: 0.5 fourth: 0.75 - this could be 0.6 if fourth one gets started while third one is being played, relativeDuration: out of 100% of entire animation here they are 0.25 + 0.25 + 0.25 + 0.25
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.label.transform = .identity
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.label.center = self.view.center
            })
        }, completion: nil) // completion gets called after all animation is done
    }
    
    @objc func springButtonTapped() {
        label.center = self.view.center
        
        self.label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    @objc func squashButtonTapped() {
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let aniBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                self.label.center = self.view.center
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.05, animations: {
                self.label.transform = .identity
            })
        }
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: aniBlock, completion: nil)
    }
    
    @objc func anticButtonTapped() {
        self.label.center = self.view.center
        let aniBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2, animations: {
                self.label.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 2.0)  //this will rotate 90 degree more to the left since negative value
                //self.label.transform = .identity    //this will just return the rotation back to where it started
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.7, animations: {
                self.label.center = CGPoint(x: self.view.bounds.size.width + self.label.bounds.size.width, y: self.view.center.y)
            })
        }
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: aniBlock, completion: nil)
    }
}

