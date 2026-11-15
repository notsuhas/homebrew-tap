class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.2.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "4239c7e7bd60122a0a2a519ec13ff135a8d343614a7a36fd225630f3c0cdfe3a"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "7367359e821ee04b08517cc33b420b18da4644e3437d9ce862411f78a93ae3e4"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "d3dd62c9cfe7579c3b578844d38e794641d59586362703c1ceb55fefb53d820f"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "d65b6745b557fcbc49e0fd9a8f28af512a069bb519745bf742c314814b5c9225"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
