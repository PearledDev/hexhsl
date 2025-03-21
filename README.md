# hexhsl

> A cross-platform CLI tool that converts hex color codes to HSL written in Swift by Pearled.

![CI](https://github.com/PearledDev/hexhsl/actions/workflows/ci-cd.yml/badge.svg)

---

## 🔧 What it does

`hexhsl` takes a hex color code (e.g. `#ffffff` or `336699`) and converts it to HSL format:

```bash
$ hexhsl "#ffffff"
0 0% 100%

$ hexhsl 336699
210 50% 40%
```

---

## 📦 Installation

### macOS, Linux, or Windows (manual)

1. [Download the latest release](https://github.com/PearledDev/hexhsl/releases)
2. Paste the binary into a folder in your `$PATH`

### Using Homebrew (only on macOS, Linux and WSL)

```bash
brew install PearledDev/ostools/hexhsl
```

---

## 🚀 Usage

```bash
hexhsl <hex-color>
```

Supports both 6-digit hex codes with or without `#`.

Examples:

```bash
hexhsl "#ff0000"
# → 0 100% 50%

hexhsl 00ff00
# → 120 100% 50%
```

---

## 🔨 Building from source

```bash
git clone https://github.com/PearledDev/hexhsl.git
cd hexhsl
swift build -c release
```
---

## 📄 License

MIT