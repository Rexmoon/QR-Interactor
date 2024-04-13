//
//  FirstView.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import SwiftUI

struct FirstView<R: FirstRouter>: View {
    
    // MARK: Properties
    
    private let router: R
    
    // MARK: Initializers
    
    init(router: R) {
        self.router = router
    }
    
    // MARK: View
    
    var body: some View {
        VStack(spacing: 50) {
            Button {
                router.process(route: .showSecondView)
            } label: {
                Text("Go to second view")
            }
            
            Button {
                router.process(route: .showThirdView)
            } label: {
                Text("PR template test")
            }
            
            Button {
                router.process(route: .showScannerView)
            } label: {
                Text("Scan QR Code")
            }
        }
    }
}

// MARK: Preview

#Preview {
    let app = App()
    let coordinator = FirstCoordinator(router: app)
    return FirstView(router: coordinator)
}
