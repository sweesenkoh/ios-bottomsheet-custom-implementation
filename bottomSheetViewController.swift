//
//  BottomSheetViewController.swift
//  TestBottomSheet
//
//  Created by Koh Swee Sen on 8/4/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    public let containerView = UIView()
    public let containerHeight: CGFloat = UIScreen.main.bounds.height * 0.7
    public let minimumContainerHeight: CGFloat = UIScreen.main.bounds.height * 0.5
    private var initialTouchPoint: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateContainerView(show: true)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        animateContainerView(show: false) {
            super.dismiss(animated: false, completion: completion)
        }
    }

    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        setupContainerView()
        setupGestures()
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .systemYellow
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        containerView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: self.containerHeight)
        view.addSubview(containerView)
    }
    
    private func setupGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSheetPan(_:)))
        containerView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func animateContainerView(show: Bool, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(show ? 0.4 : 0.0)
            self.containerView.frame = CGRect(
                x: 0,
                y: show ? self.view.frame.height - self.containerHeight : self.view.frame.height,
                width: self.view.frame.width,
                height: self.containerHeight)
        }, completion: { _ in completion?() })
    }

    @objc public func handleSheetPan(_ gesture: UIPanGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        
        switch gesture.state {
        case .changed:
            if initialTouchPoint == nil {
                initialTouchPoint = touchPoint
            }
            let yDelta = touchPoint.y - initialTouchPoint!.y
            containerView.frame.origin.y = max(view.frame.height - containerHeight + yDelta, 0)
            if (yDelta < 0) {
                containerView.frame = CGRect(x: containerView.frame.origin.x, y: containerView.frame.origin.y, width: containerView.frame.width, height: containerView.frame.height - yDelta)
            }
        case .ended, .cancelled:
            initialTouchPoint = nil
            let shouldDismiss = view.frame.height - containerView.frame.origin.y < minimumContainerHeight
            if shouldDismiss {
                dismiss(animated: true)
            } else {
                animateContainerView(show: true)
            }
        default: break
        }
    }

    @objc private func handleBackgroundTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: containerView)
        if !containerView.bounds.contains(location) {
            dismiss(animated: true)
        }
    }
}
