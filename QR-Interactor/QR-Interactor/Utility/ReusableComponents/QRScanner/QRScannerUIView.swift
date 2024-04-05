//
//  QRScannerViewModel.swift
//  QR-Interactor
//
//  Created by Jose Luna on 4/4/24.
//

// MARK: - Constants

import AVFoundation
import UIKit

fileprivate enum Constants {
    case alertTitle
    case alertMessage
    case alertButtonTitle
    
    var text: String {
        return switch self {
            case .alertTitle: "Scanning not work"
            case .alertMessage: "Please use a device with camera"
            case .alertButtonTitle: "Ok"
        }
    }
}

import AVFoundation
import AVKit
import UIKit

final class QRScannerUIView: UIView {
    
    // MARK: - Properties
    
    private lazy var session: AVCaptureSession = .init()
    
    private var allowCameraAccess: Bool {
        get async {
            let currentState = AVCaptureDevice.authorizationStatus(for: .video)
            var allowed = currentState == .authorized
            
            if !allowed {
                allowed = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return allowed
        }
    }
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        cameraSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func cameraSetup() {
        Task {
            guard await allowCameraAccess
            else {
                debugPrint("Error: Camera access denied")
                return
            }
        }
        
        guard let device = AVCaptureDevice.default(for: .video)
        else {
            debugPrint("Error: Video device not found")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            let output = AVCaptureMetadataOutput()
            
            session.addInput(input)
            session.addOutput(output)
            
            output.metadataObjectTypes = [.qr, .microQR]
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = bounds
            
            layer.addSublayer(previewLayer)
            
            session.startRunning()
        } catch {
            
            // TODO: - Handle error
            
            print(error)
        }
    }
}
