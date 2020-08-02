/*

TRImageOverlay.m

Copyright (c) 2020 Truong Vinh Tran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import Foundation

// MARK: - TRImageOverlay

/** Class for image overlay.*/
public class TRImageOverlay {
    
    // MARK: - Local Variable
    
    /// image size
    private var size: CGSize
    
    /// background color, default is white
    private var bgColor: UIColor = UIColor.white
    
    /// alpha value of overlay, default value is 1
    private var alpha: Float = 1.0
    
    
    // MARK: - Content
    
    /// font with default size 12
    private var font: UIFont = UIFont.systemFont(ofSize: 12)
    
    /// text color
    private var fgColor: UIColor = UIColor.black
    
    /// number of generated text items
    private var number: Int = 10
    
    /// random orientation flag
    private var randomized: Bool = false
    
    public init (with size: CGSize) {
        self.size = size
    }
    
    public func generate(content: String, with number: Int) -> UIImage? {
        
        let frame = CGRect(origin: CGPoint.zero, size: self.size)
        
        let nameLabel = UILabel(frame: frame)
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = self.bgColor
        nameLabel.textColor = self.fgColor
        nameLabel.font = self.font
        nameLabel.text = content
        UIGraphicsBeginImageContext(frame.size)
         if let currentContext = UIGraphicsGetCurrentContext() {
            nameLabel.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            
            guard let image = nameImage else {
                return UIImage()
            }
            
            return image
         }
        
        return nil
    }
}
