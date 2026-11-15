class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "e01e803aa2ee839a3a265f92a8975b506c45a1796e6a87d9ef809af637ae40c9"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "0f066888df4e63904525bdee38db430dd6f0d3750d1c3ea17c24e7cd801eed82"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "70bcffcd89e66015055ebd1beda34696b0870124e833e04b27e63dd36feea71e"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "78c5728609f18ce778c14b534521b62140ea6947fbb7e61b23d1b8c1c190a625"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
