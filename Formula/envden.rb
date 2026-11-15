class Envden < Formula
  desc "Self-hosted encrypted environment sync"
  homepage "https://envden.theclau.de"
  version "0.3.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-arm64"
      sha256 "828843e5789ec134a0526fc836dd618f391ff34bc103dd0787459508c2601677"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-darwin-x64"
      sha256 "e4abf70c49829bd0e117efe04679882d03aca5972f3ac2e497045c0ccabdbcdd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-arm64"
      sha256 "7023012d67617dcdaabb8496adbb170a7efad1b16052432bec5533116727e86c"
    else
      url "https://github.com/notsuhas/envden/releases/download/v#{version}/envden-linux-x64"
      sha256 "ddc997a78b19eae5450ff48d061a590ebb8567a9fa27906ec33e2e4c6cf3ba4c"
    end
  end
  def install
    bin.install Dir["envden-*"].first => "envden"
  end
  test do
    system bin/"envden", "--version"
  end
end
