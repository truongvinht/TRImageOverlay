import XCTest
import TRImageOverlay

class TestOverlay: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreatingOverlay() {
        let overlay = TRImageOverlay(with: CGSize(width: 1000, height: 1000))
        
        guard let img = overlay.generateFull(content: "Example") else {
            print("image not generate")
            return
        }
        
        if let jpegData = img.pngData() {
            let name = TRImageOverlay.documentDirectory().appendingPathComponent("test-big.png")
            try? jpegData.write(to: name)
        }
        XCTAssert(true, "Pass")
    }
    
    func testCreatingToSmallOverlay() {
        let overlay = TRImageOverlay(with: CGSize(width: 1, height: 1))
        
        guard let img = overlay.generateFull(content: "Example") else {
            print("image not generate")
            return
        }
        
        if let jpegData = img.pngData() {
            let name = TRImageOverlay.documentDirectory().appendingPathComponent("test-small.png")
            try? jpegData.write(to: name)
        }
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
