//
//  ViewLifecycleModifier.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import SwiftUI
import UIKit

struct ViewLifecycleModifier: ViewModifier {
    let onInit: (() -> Void)?
    let onAwakeFromNib: (() -> Void)?
    let onLoadView: (() -> Void)?
    let onViewDidLoad: (() -> Void)?
    let onViewWillAppear: (() -> Void)?
    let onViewIsAppearing: (() -> Void)?
    let onViewWillLayoutSubviews: (() -> Void)?
    let onViewDidLayoutSubviews: (() -> Void)?
    let onViewDidAppear: (() -> Void)?
    let onViewWillTransition: ((CGSize, UIViewControllerTransitionCoordinator) -> Void)?
    let onViewWillDisappear: (() -> Void)?
    let onViewDidDisappear: (() -> Void)?
    let onDeinit: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .background(
                ViewControllerRepresentable(
                    onInit: onInit,
                    onAwakeFromNib: onAwakeFromNib,
                    onLoadView: onLoadView,
                    onViewDidLoad: onViewDidLoad,
                    onViewWillAppear: onViewWillAppear,
                    onViewIsAppearing: onViewIsAppearing,
                    onViewWillLayoutSubviews: onViewWillLayoutSubviews,
                    onViewDidLayoutSubviews: onViewDidLayoutSubviews,
                    onViewDidAppear: onViewDidAppear,
                    onViewWillTransition: onViewWillTransition,
                    onViewWillDisappear: onViewWillDisappear,
                    onViewDidDisappear: onViewDidDisappear,
                    onDeinit: onDeinit
                )
            )
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    let onInit: (() -> Void)?
    let onAwakeFromNib: (() -> Void)?
    let onLoadView: (() -> Void)?
    let onViewDidLoad: (() -> Void)?
    let onViewWillAppear: (() -> Void)?
    let onViewIsAppearing: (() -> Void)?
    let onViewWillLayoutSubviews: (() -> Void)?
    let onViewDidLayoutSubviews: (() -> Void)?
    let onViewDidAppear: (() -> Void)?
    let onViewWillTransition: ((CGSize, UIViewControllerTransitionCoordinator) -> Void)?
    let onViewWillDisappear: (() -> Void)?
    let onViewDidDisappear: (() -> Void)?
    let onDeinit: (() -> Void)?
    
    func makeUIViewController(context: Context) -> LifecycleViewController {
        let controller = LifecycleViewController(
            onInit: onInit,
            onAwakeFromNib: onAwakeFromNib,
            onLoadView: onLoadView,
            onViewDidLoad: onViewDidLoad,
            onViewWillAppear: onViewWillAppear,
            onViewIsAppearing: onViewIsAppearing,
            onViewWillLayoutSubviews: onViewWillLayoutSubviews,
            onViewDidLayoutSubviews: onViewDidLayoutSubviews,
            onViewDidAppear: onViewDidAppear,
            onViewWillTransition: onViewWillTransition,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear,
            onDeinit: onDeinit
        )
        
        if let onInit = onInit {
            onInit()
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: LifecycleViewController, context: Context) {}
    
    class LifecycleViewController: UIViewController {
        let onInit: (() -> Void)?
        let onAwakeFromNib: (() -> Void)?
        let onLoadView: (() -> Void)?
        let onViewDidLoad: (() -> Void)?
        let onViewWillAppear: (() -> Void)?
        let onViewIsAppearing: (() -> Void)?
        let onViewWillLayoutSubviews: (() -> Void)?
        let onViewDidLayoutSubviews: (() -> Void)?
        let onViewDidAppear: (() -> Void)?
        let onViewWillTransition: ((CGSize, UIViewControllerTransitionCoordinator) -> Void)?
        let onViewWillDisappear: (() -> Void)?
        let onViewDidDisappear: (() -> Void)?
        let onDeinit: (() -> Void)?
        
        init(
            onInit: (() -> Void)?,
            onAwakeFromNib: (() -> Void)?,
            onLoadView: (() -> Void)?,
            onViewDidLoad: (() -> Void)?,
            onViewWillAppear: (() -> Void)?,
            onViewIsAppearing: (() -> Void)?,
            onViewWillLayoutSubviews: (() -> Void)?,
            onViewDidLayoutSubviews: (() -> Void)?,
            onViewDidAppear: (() -> Void)?,
            onViewWillTransition: ((CGSize, UIViewControllerTransitionCoordinator) -> Void)?,
            onViewWillDisappear: (() -> Void)?,
            onViewDidDisappear: (() -> Void)?,
            onDeinit: (() -> Void)?
        ) {
            self.onInit = onInit
            self.onAwakeFromNib = onAwakeFromNib
            self.onLoadView = onLoadView
            self.onViewDidLoad = onViewDidLoad
            self.onViewWillAppear = onViewWillAppear
            self.onViewIsAppearing = onViewIsAppearing
            self.onViewWillLayoutSubviews = onViewWillLayoutSubviews
            self.onViewDidLayoutSubviews = onViewDidLayoutSubviews
            self.onViewDidAppear = onViewDidAppear
            self.onViewWillTransition = onViewWillTransition
            self.onViewWillDisappear = onViewWillDisappear
            self.onViewDidDisappear = onViewDidDisappear
            self.onDeinit = onDeinit
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) is not supported - use SwiftUI-compatible initializers only")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            onAwakeFromNib?()
        }
        
        override func loadView() {
            super.loadView()
            onLoadView?()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            onViewDidLoad?()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            onViewWillAppear?()
        }
        
        @available(iOS 13.0, *)
        override func viewIsAppearing(_ animated: Bool) {
            super.viewIsAppearing(animated)
            onViewIsAppearing?()
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            onViewWillLayoutSubviews?()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            onViewDidLayoutSubviews?()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            onViewDidAppear?()
        }
        
        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            onViewWillTransition?(size, coordinator)
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            onViewWillDisappear?()
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            onViewDidDisappear?()
        }
        
        deinit {
            onDeinit?()
        }
    }
}

extension View {
    func viewLifecycle(
        onInit: (() -> Void)? = nil,
        onAwakeFromNib: (() -> Void)? = nil,
        onLoadView: (() -> Void)? = nil,
        onViewDidLoad: (() -> Void)? = nil,
        onViewWillAppear: (() -> Void)? = nil,
        onViewIsAppearing: (() -> Void)? = nil,
        onViewWillLayoutSubviews: (() -> Void)? = nil,
        onViewDidLayoutSubviews: (() -> Void)? = nil,
        onViewDidAppear: (() -> Void)? = nil,
        onViewWillTransition: ((CGSize, UIViewControllerTransitionCoordinator) -> Void)? = nil,
        onViewWillDisappear: (() -> Void)? = nil,
        onViewDidDisappear: (() -> Void)? = nil,
        onDeinit: (() -> Void)? = nil
    ) -> some View {
        self.modifier(ViewLifecycleModifier(
            onInit: onInit,
            onAwakeFromNib: onAwakeFromNib,
            onLoadView: onLoadView,
            onViewDidLoad: onViewDidLoad,
            onViewWillAppear: onViewWillAppear,
            onViewIsAppearing: onViewIsAppearing,
            onViewWillLayoutSubviews: onViewWillLayoutSubviews,
            onViewDidLayoutSubviews: onViewDidLayoutSubviews,
            onViewDidAppear: onViewDidAppear,
            onViewWillTransition: onViewWillTransition,
            onViewWillDisappear: onViewWillDisappear,
            onViewDidDisappear: onViewDidDisappear,
            onDeinit: onDeinit
        ))
    }
}
