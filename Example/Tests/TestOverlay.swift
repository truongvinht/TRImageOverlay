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
        
        guard let img = overlay.generateOverlay(content: "Example") else {
            print("image not generate")
            return
        }
        
        if let jpegData = img.pngData() {
            let name = TRImageOverlay.documentDirectory().appendingPathComponent("test-big.png")
            try? jpegData.write(to: name)
        }
        XCTAssert(true, "Pass")
    }
    
    func testCreatingTooSmallOverlay() {
        let overlay = TRImageOverlay(with: CGSize(width: 1, height: 1))
        
        guard let img = overlay.generateOverlay(content: "Example") else {
            print("image not generate")
            return
        }
        
        if let jpegData = img.pngData() {
            let name = TRImageOverlay.documentDirectory().appendingPathComponent("test-small.png")
            try? jpegData.write(to: name)
        }
        XCTAssert(true, "Pass")
    }
    
    func testCreatingEmptyOverlay() {
        let overlay = TRImageOverlay(with: CGSize(width: 100, height: 100))
        
        guard let _ = overlay.generateOverlay(content: "") else {
            XCTAssert(true, "Content is empty as expected")
            return
        }
        XCTAssert(false, "Content is not empty")
    }
    
    func testPerformanceExample() {
        self.measure() {
            testCreatingOverlay()
        }
    }
    
}
