//
//  main.swift
//
//  Created by Pearled on 21/03/2025.
//

import Foundation

func hexToRGB(_ hex: String) -> (r: Double, g: Double, b: Double)? {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    guard hex.count == 6,
          let intVal = Int(hex, radix: 16) else {
        return nil
    }
    let r = Double((intVal >> 16) & 0xFF) / 255.0
    let g = Double((intVal >> 8) & 0xFF) / 255.0
    let b = Double(intVal & 0xFF) / 255.0
    return (r, g, b)
}

func rgbToHSL(r: Double, g: Double, b: Double) -> (h: Int, s: Int, l: Int) {
    let maxVal = max(r, g, b)
    let minVal = min(r, g, b)
    let delta = maxVal - minVal
    let l = (maxVal + minVal) / 2

    var h: Double = 0
    var s: Double = 0

    if delta != 0 {
        s = l > 0.5 ? delta / (2 - maxVal - minVal) : delta / (maxVal + minVal)

        if maxVal == r {
            h = (g - b) / delta + (g < b ? 6 : 0)
        } else if maxVal == g {
            h = (b - r) / delta + 2
        } else {
            h = (r - g) / delta + 4
        }
        h /= 6
    }

    return (Int(round(h * 360)), Int(round(s * 100)), Int(round(l * 100)))
}

func main() {
    let args = CommandLine.arguments
    
    if args.count == 2 && args[1] == "--version" {
        print("hexhsl v0.1.1")
        exit(0)
    }
    
    guard args.count == 2 else {
        print("hexhsl by Pearled")
        print("Usage: hexhsl <hex>")
        print("       hexhsl --version")
        exit(1)
    }

    let input = args[1]
    guard let rgb = hexToRGB(input) else {
        print("Invalid hex color format.")
        exit(1)
    }

    let hsl = rgbToHSL(r: rgb.r, g: rgb.g, b: rgb.b)
    print("\(hsl.h) \(hsl.s)% \(hsl.l)%")
}

main()
