class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "d14668357e4b80a75226d4d3dde5032553c6449c1bd74e4e74e75937fbe67b2c"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "cfc6c5fd456711291574b0fc594cf1a8cacad0f728be52b4a7b924757a69df86"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "9b2db64572f4eedbc9e293372b310d58022803af0c61919724de33bf4940f424"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "3f58d5806b96798834d3a512d28f6152f1e3a1fbf266cda7e350fdb931eed852"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
