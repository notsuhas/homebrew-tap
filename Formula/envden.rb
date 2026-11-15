class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.6"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "6ce68ace44f37adb35e1a56f43854a4e688646120cf82d53760654390396dfa1"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "06d9178ee40751c147e15b8bf4a5c5fe190296c352ca220d62a2adc6694764ff"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "9a8de88283cbc0262f1317b406544950687af71dea34a995e169e2a8d14dfcbb"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "1a048e90eebd49925ae8d7c9f22bdb4771847175bed0c884be382157125ca5d1"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
