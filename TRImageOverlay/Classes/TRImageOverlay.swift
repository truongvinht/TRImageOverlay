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
    var bgColor: UIColor = UIColor.clear
    
    /// alpha value of overlay, default value is 1
    var alpha: CGFloat = 1.0
    
    
    // MARK: - Content
    
    /// font with default size 12
    var font: UIFont = UIFont.systemFont(ofSize: 12)
    
    /// text color
    var fgColor: UIColor = UIColor.black
    
    /// number of generated text items
    private var number: Int = 10
    
    /// random orientation degree
    private var degree: Double = 0.0
    
    public init (with size: CGSize) {
        self.size = size
    }
    
    public func generate(content: String, with number: Int) -> UIImage? {
        
        let frame = CGRect(origin: CGPoint.zero, size: self.size)
        
        // use tmp label for getting size
        let tmpLabel = UILabel()
        tmpLabel.font = self.font
        tmpLabel.text = content
        
        let fontSize = tmpLabel.intrinsicContentSize
        

        print("Base: \(fontSize)")
        
        UIGraphicsBeginImageContext(frame.size)
         if let context = UIGraphicsGetCurrentContext() {
            
            let entries = numberOfColumnsAndRows(within: frame.size, objectSize: fontSize)

            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.left
            
            var fColor = self.fgColor
            var bColor = self.bgColor
            
            if UIColor.clear != fColor && self.alpha < 1 {
                fColor = self.fgColor.withAlphaComponent(self.alpha)
            }
            
            if UIColor.clear != bColor && self.alpha < 1 {
                bColor = self.bgColor.withAlphaComponent(self.alpha)
            }
            
            
            let attributes = [
                NSAttributedString.Key.foregroundColor: fColor,
                NSAttributedString.Key.backgroundColor: bColor,
                NSAttributedString.Key.font: self.font,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
            context.saveGState()
            //context.translateBy(x: 500, y: 500)
            //context.rotate(by: 20 * CGFloat(M_PI / 180))
            
            for row in 0...entries.x {
                for column in 0...entries.y {

                    
                    let text = NSString(string: content)
                    let labelFrame = position(within: frame.size, objectSize: fontSize, row: row, column: column)
                    
                    text.draw(at: labelFrame.origin, withAttributes: attributes)
                }
            }
            context.restoreGState()
            
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            
            guard let image = nameImage else {
                return UIImage()
            }
            
            return image
         }
        
        return nil
    }
    
    func numberOfColumnsAndRows(within: CGSize, objectSize: CGSize) -> (x: Int, y: Int) {
        
        if CGSize.zero.equalTo(objectSize) {
            return (1, 1)
        }
        
        // x axis, columns
        let columns = Int((within.width / 2) / objectSize.width)
        let rows = Int((within.height / 2) / objectSize.height)
        
        return (columns, rows)
    }
    
    func position(within: CGSize, objectSize: CGSize, row: Int, column: Int) -> CGRect {
        
        var result = CGRect(origin: CGPoint.zero, size: objectSize)
        
        result.origin.x = objectSize.width * CGFloat(row * 2)
        result.origin.y = objectSize.height * CGFloat(column * 2)
        return result
    }
}
