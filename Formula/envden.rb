class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.2.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "7a95f17df7a0b08c80e5cc94e4e05e37312e3f9db57247af11a2aa03c2002815"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "b5cbff45ded3065940cfe1f1a2680114e58f154b936185f367b284e3331d70c0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "d4cf96618d82f4f509a19052d71f60073ea5cbf23a0d31b67e07aa308127fef5"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "2cd2d167ecb80908f8341299bcdfc3ccf767b29f2f073f1fd17decc45066ae9a"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
