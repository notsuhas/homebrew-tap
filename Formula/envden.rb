class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "44b245955898b81902c655ae89c12f4683c52f2ddb25b253bf7ec323c10c0949"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "4214973679e31758b33090037687a06913e88e093e62bf264736bed18a521abc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "2a22dbd5c6d267de092cc7afa75d1f5e00efd9a19a3dc4914c3d0f3f3fd925c4"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "9bc5703ec997a76bad88da6a84e0102e4272a774f24f964f05f23f1202577086"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
