class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "f5dd0ebd0bdd25e6f1d083f874a8c0b4e81045fd9f6ebe3427025bef8d82fd37"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "a079abd3bd39933c67d7c4e277c21fa6bf5c52604f8ba293418d90adbddffb3b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "e495ae3205d7a05911c59a87668bb785d75aaa5ef7a43003e78410f5e419babd"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "f01bfc75f76933eb01e0bbbea3b039bfe308850e1632fda860a0f6ab5c0f0cca"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
