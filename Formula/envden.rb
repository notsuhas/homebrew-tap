class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.8"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "d0e4115acc79cd61f278bc7a24e72b55714be0f1a1bd242e1d8e7c6915005d63"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "403e06bd90fc79057b03cd12cf2cd5b8bad676ee43785bdaa1e59b25d7c38cc8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "d2e99f6419074dc670a16189b5764f46017b1badd2aafaa04b178649a5ad21a6"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "22f905d798267ac19d892c613ed47c28f515f6b8ccd435df1c4a328822faea15"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
