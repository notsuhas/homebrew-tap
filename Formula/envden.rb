class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "561df3873bfaf387d61c5c43fc3aa0ce90b10df5caf2d86c96dc94a9c43e590b"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "096ed43aa77c3ec265d87d723af1de2b3c3da8b26ca3769ee3c311d8afdbe1f6"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "360df6a82bb78c6b964c2fd87d745d350f1656c594ecb67c05743369d7f32500"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "e51d5f7f21f06b345b7dbf879489f40d45f8b9e381b6c7842efc7daea22a44e9"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
