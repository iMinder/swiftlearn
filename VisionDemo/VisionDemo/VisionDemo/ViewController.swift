//
//  ViewController.swift
//  VisionDemo
//
//  Created by hongwuzhao on 5/5/19.
//  Copyright © 2019 tencent. All rights reserved.
//

import UIKit
import CoreImage
import Vision

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    private let ciImageDectorButton: UIButton = {
        let button = UIButton()
        button.setTitle("CIImageDector", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private let visionDectorButton: UIButton = {
        let button = UIButton()
        button.setTitle("VisionDector", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(ciImageDectorButton)
        view.addSubview(visionDectorButton)
        imageView.image = UIImage(named: "ocr_test1")
        ciImageDectorButton.addTarget(self, action: #selector(ViewController.ciImageDector), for: .touchUpInside)
        visionDectorButton.addTarget(self, action: #selector(ViewController.visionDector), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: 20, width: 200, height: 200)
        imageView.center.x = view.bounds.width / 2
        ciImageDectorButton.frame = CGRect(x: 0, y: 0, width: 140, height: 44)
        ciImageDectorButton.center =  CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        visionDectorButton.frame = CGRect(x: 0, y: 0, width: 120, height: 44)
        visionDectorButton.center = CGPoint(x: ciImageDectorButton.center.x, y: ciImageDectorButton.center.y + 40)

    }

@objc func ciImageDector(sender: UIButton) {
        let options = [CIDetectorAccuracy: CIDetectorAccuracyLow,
                       CIDetectorMaxFeatureCount: 255] as [String : Any]
        let ciDetector = CIDetector(ofType: CIDetectorTypeText, context: nil, options: options)
        if let cgImage = imageView.image?.cgImage,  let results = ciDetector?.features(in: CIImage(cgImage: cgImage)) {
            results.forEach {
                print("feature \($0.type)")
            }
        }
    }

    @objc func visionDector(sender: UIButton) {
        if let cgImage = imageView.image?.cgImage {
            let reqeust = VNDetectTextRectanglesRequest()
            let myRequestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? myRequestHandler.perform([reqeust])
            reqeust.results?.forEach{
                print("feature \($0)")
            }
        }


    }
}

