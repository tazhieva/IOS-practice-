//
//  Animator.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let presentationStartButton: UIButton
    
    let isPresenting: Bool
    
    init(presentationStartButton: UIButton, isPresenting: Bool) {
        self.presentationStartButton = presentationStartButton
        self.isPresenting = isPresenting
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresenting {
            present(using: transitionContext)
        } else {
            dismiss(using: transitionContext)
        }
        
    }
    
    private let animationDuration: TimeInterval = 0.4
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }

    func present(using transitionContext: UIViewControllerContextTransitioning) {

        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}

        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        
        source.view.frame  = transitionContext.containerView.frame
        destination.view.frame  = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(translationX: destination.view.bounds.width, y: 0)
        
        UIView.animate(withDuration: animationDuration) {
            destination.view.transform = .identity
        } completion: { completed in
            transitionContext.completeTransition(completed)
        }
        
    }
    

    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}

        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        

        source.view.frame  = transitionContext.containerView.frame
        destination.view.frame  = transitionContext.containerView.frame
        
        source.view.transform = .identity
        
        UIView.animate(withDuration: animationDuration) {
            source.view.transform = CGAffineTransform(translationX: destination.view.bounds.width, y: 0)
        } completion: { completed in
            transitionContext.completeTransition(completed)
        }
    }
}
