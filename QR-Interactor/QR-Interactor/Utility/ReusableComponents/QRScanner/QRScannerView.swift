//
//  QAScannerView.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

import SwiftUI

struct QRScannerView: View {
    
    // MARK: Properties
    
    private let viewModel: QRScannerUIView = .init()
    
    // MARK: View
    
    var body: some View {
        ZStack {
            
            QRScannerPreview()
            
            Color.blue.opacity(0.2)
                .blendMask {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 200, height: 200)
                }
        }
    }
}

// MARK: - Blend Mask

fileprivate extension View {
    func blendMask<Mask: View>(@ViewBuilder _ mask: () -> Mask) -> some View {
        self.mask {
            Rectangle()
                .overlay {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}

// MARK: UIView Representable

fileprivate struct QRScannerPreview: UIViewRepresentable {
    
    private let scannerView = QRScannerUIView()
    
    func makeUIView(context: Context) -> QRScannerUIView {
        scannerView
    }
    
    func updateUIView(_ view: QRScannerUIView, context: Context) { }
}

#Preview {
    QRScannerView()
}
