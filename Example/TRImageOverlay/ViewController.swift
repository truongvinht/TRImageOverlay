//
//  ViewController.swift
//  TRImageOverlay
//
//  Created by Truong Vinh Tran on 08/02/2020.
//  Copyright © 2020 Truong Vinh Tran. All rights reserved.
//

import UIKit
import TRImageOverlay

class ViewController: UIViewController {
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print("Write to \(paths[0].absoluteString)")
        return paths[0]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init new overlay
        let overlay = TRImageOverlay(with: CGSize(width: 1000, height: 1000))
        
        guard let img = overlay.generateOverlay(content: "Example") else {
            print("image not generate")
            return
        }
        
        if let jpegData = img.pngData() {
            let name = getDocumentsDirectory().appendingPathComponent("test-TRImageOverlay.png")
            try? jpegData.write(to: name)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
