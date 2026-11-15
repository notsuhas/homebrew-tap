class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "9608949f4fc9f6ca0e667d6e2660b16a7468943cc1eb3f3d1eacad23737fd88c"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "7062d396d4dfa4022eb9d8aa05980efc23f7112bbcb06eecdebfe393ac505726"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "eca0fae0dfb16e1927ac9594691d13abecf6da4daea538aa94781de0579543a4"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "6cae6fbe87b3ee74e3865a76f4b9b955a0424c061ab09780403158003540de7b"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
