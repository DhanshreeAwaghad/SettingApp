//
//  SlideInPresentationAnimator.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 20/03/24.
//

import Foundation
import UIKit

class SlideInPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let isPresentation: Bool
    
    init(isPresentation: Bool) {
        self.isPresentation = isPresentation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        let fromView = transitionContext.view(forKey: .from)
        
        let presentedViewController = isPresentation ? toView : fromView
        containerView.addSubview(presentedViewController!)
        
        let offScreenFrame = CGRect(x: containerView.bounds.width, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
        presentedViewController?.frame = isPresentation ? offScreenFrame : containerView.bounds
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedViewController?.frame = self.isPresentation ? containerView.bounds : offScreenFrame
        }) { finished in
            transitionContext.completeTransition(finished)
        }
    }
    
        // MARK: - UIViewControllerTransitioningDelegate Methods
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(isPresentation: false)
    }
}
