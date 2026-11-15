class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.2.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "9a7cc495387317ec3ac2d50c0733d4e75cc051ea57bc39168966a0841d4dcbfc"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "da9698dfe49e16534a83689cb9f38a365d6e6eb82710d50ef4d1a17c18ca061f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "90b41fe89daeab1079524a9deaf7725b49dfc81d1f158986d22356abacb9082d"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "7567dee5888d82efdb7766c896ce2dfe93adda0d81ce41eec3807aebc1b541e3"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
