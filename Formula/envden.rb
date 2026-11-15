class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "a587d51fd0e572a52a066f8c605b3ab6c63f91d084f358edc015a4b18f6f6619"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "c9ebe848e8b149d3b9322c0a33eb08d003999d95f2e305bed5ecaa09da97774b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "75225eba9d95a69209e35ed4511df1aa5a71761f7f696dd925b83c31d282d458"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "91f2fb4fbc3e5599d65b95244c40b9120656d8ec39815fd99de58024d057266d"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
