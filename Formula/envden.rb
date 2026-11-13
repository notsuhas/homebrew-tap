class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.1.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "a652745aa0b0507cd870a8211ab35de5d03d611f3a8f2616243a0bc7ba38cb7f"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "54f5e8b77f9f5a84759ca2cbdff506e461f9ce353dea54d897e1fd8c9e933130"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "9f80ea8a307357de4a06262df30b34d1d4f46c904f849721b0d056c964276dbf"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "e2c040a41e9883d8ceb913f6744f583c816730648d965079e893d7b005d63d1c"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  def caveats
    "Run with ENVDEN_INSTALL_METHOD=brew so envden update uses Homebrew."
  end
  test do
    system bin/"envden", "--version"
  end
end
