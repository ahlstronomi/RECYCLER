//
//  ViewController.swift
//  GreenCycle
//
//  Created by Mikael Ahlström on 02/05/2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var labelWasWhenCaptured: String = ""
    var correctCategory: String = ""
    var pixelBufferWas: AnyObject?
    var categories: [Category]?
    
    // MARK: Components
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(50)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        button.layer.cornerRadius = 30
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.green.cgColor
        button.setTitleColor(UIColor.green, for: .normal)
        button.setTitle("That's it!", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        return UIVisualEffectView(effect: blurEffect)
    }()
    
    var alert: UIAlertController {
        
        let alert = UIAlertController(title: labelWasWhenCaptured, message: "This belongs into the \(correctCategory)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Info", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            self.goToCategory(self.correctCategory)
            self.insertBlurView(false)
        }))
        
        alert.addAction(UIAlertAction(title: "Incorrect", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel logic here")
            self.insertBlurView(false)
        }))
        
        return alert
    }
    
    var previewLayer: CALayer!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        self.navigationController!.navigationBar.backgroundColor = UIColor.clear
        
        setupCaptureSession()
        
        view.addSubview(label)
        setupLabel()
        
        view.addSubview(button)
        setupButton()
        
        edgesForExtendedLayout = .all
        view.insetsLayoutMarginsFromSafeArea = false
        
        categories = Category.getAllCategories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        previewLayer.frame = view.bounds
    }
    
    // MARK: Functionality
    
    // called everytime a frame is captured
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let model = try? VNCoreMLModel(for: mlModel().model) else {return}
        
        let request = VNCoreMLRequest(model: model) { (finishedRequest, error) in
            
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }
            guard let Observation = results.first else { return }
            
            DispatchQueue.main.async(execute: {
                self.label.text = "\(Observation.identifier)"
            })
        }
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        pixelBufferWas = pixelBuffer
        
        // executes request
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        labelWasWhenCaptured = self.label.text ?? "nil"
        print(labelWasWhenCaptured)
        setCorrectCategory()
        
        // Display blur view
        insertBlurView(true)
        // Present alert
        self.present(alert, animated: true)
    }
    
    func setCorrectCategory() {
        switch labelWasWhenCaptured {
        case "Banana":
            correctCategory = "Biowaste"
        case "Light bulb":
            correctCategory = "Hazardous waste"
        case "Computer":
            correctCategory = "Hazardous waste"
        case "Phone":
            correctCategory = "Hazardous waste"
        case "Paper":
            correctCategory = "Paper"
        case "Battery":
            correctCategory = "Hazardous waste"
        case "Glass Bottle":
            correctCategory = "Glass"
        case "Plastic":
            correctCategory = "Plastic"
        default:
            correctCategory = "ERROR"
            print("Label \(labelWasWhenCaptured) not in switch")
        }
        
    }
    
    func goToCategory(_ categoryName: String) {
        if (categoryName == "ERROR") {
            return
        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let categoryInfoViewController = storyBoard.instantiateViewController(withIdentifier: "categoryInfoView") as! CategoryInfoViewController
            
            guard let categories = categories else { return }
            for category in categories {
                if category.name == categoryName {
                    categoryInfoViewController.category = category
                }
            }
            
            self.navigationController?.pushViewController(categoryInfoViewController, animated: true)
        }
    }
    
    // MARK: Setup Components
    
    func setupLabel() {
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    
    func setupButton() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    func setupCaptureSession() {
        let captureSession = AVCaptureSession()
        
        // search for available capture devices
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        
        // setup capture device, add input to our capture session
        do {
            if let captureDevice = availableDevices.first {
                let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
                captureSession.addInput(captureDeviceInput)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // setup output, add output to our capture session
        let captureOutput = AVCaptureVideoDataOutput()
        captureOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(captureOutput)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.bounds
        previewLayer.contentsScale = UIScreen.main.scale
        previewLayer.contentsGravity = kCAGravityResizeAspectFill
        
        view.layer.bounds = view.bounds
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    // MARK: Helper methods
    
    fileprivate func insertBlurView(_ shouldInsert: Bool) {
        if shouldInsert {
            if !view.subviews.contains(blurView) {
                blurView.frame = view.bounds
                view.addSubview(blurView)
            }
        } else {
            blurView.removeFromSuperview()
        }
        
    }
    
    
}
