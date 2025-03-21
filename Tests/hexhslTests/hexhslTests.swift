//
//  hexhslTests.swift
//  hexhsl
//
//  Created by Joseph Burke on 21/03/2025.
//

import XCTest
@testable import hexhsl

final class ColorToHSLTests: XCTestCase {

    func testHexToRGBWhite() {
        let result = hexToRGB("#ffffff")
        XCTAssertEqual(result!.r, 1.0, accuracy: 0.001)
        XCTAssertEqual(result!.g, 1.0, accuracy: 0.001)
        XCTAssertEqual(result!.b, 1.0, accuracy: 0.001)
    }

    func testHexToRGBBlack() {
        let result = hexToRGB("000000")
        XCTAssertEqual(result!.r, 0.0, accuracy: 0.001)
        XCTAssertEqual(result!.g, 0.0, accuracy: 0.001)
        XCTAssertEqual(result!.b, 0.0, accuracy: 0.001)
    }

    func testHexToRGBInvalid() {
        let result = hexToRGB("zzz")
        XCTAssertNil(result)
    }

    func testRGBToHSLWhite() {
        let hsl = rgbToHSL(r: 1.0, g: 1.0, b: 1.0)
        XCTAssertEqual(hsl.h, 0)
        XCTAssertEqual(hsl.s, 0)
        XCTAssertEqual(hsl.l, 100)
    }

    func testRGBToHSLRed() {
        let hsl = rgbToHSL(r: 1.0, g: 0.0, b: 0.0)
        XCTAssertEqual(hsl.h, 0)
        XCTAssertEqual(hsl.s, 100)
        XCTAssertEqual(hsl.l, 50)
    }

    func testRGBToHSLBlue() {
        let hsl = rgbToHSL(r: 0.0, g: 0.0, b: 1.0)
        XCTAssertEqual(hsl.h, 240)
        XCTAssertEqual(hsl.s, 100)
        XCTAssertEqual(hsl.l, 50)
    }

    func testRGBToHSLCustomColor() {
        let rgb = hexToRGB("336699")!
        let hsl = rgbToHSL(r: rgb.r, g: rgb.g, b: rgb.b)
        XCTAssertEqual(hsl.h, 210)
        XCTAssertEqual(hsl.s, 50)
        XCTAssertEqual(hsl.l, 40)
    }
    func testVersion() {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: productsDirectory.appendingPathComponent("hexhsl").path)
        process.arguments = ["--version"]

        let pipe = Pipe()
        process.standardOutput = pipe
        
        try! process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        XCTAssertEqual(output, "hexhsl v0.1.1")
    }
    
    private var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
        #else
        return Bundle.main.bundleURL
        #endif
    }
}
