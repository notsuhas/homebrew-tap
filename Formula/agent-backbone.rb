class AgentBackbone < Formula
  desc "Automatic refresh and complete-plugin delivery for Skillshare"
  homepage "https://github.com/notsuhas/agent-backbone"
  url "https://github.com/notsuhas/agent-backbone/releases/download/v0.11.1/agent-backbone-0.11.1.tgz"
  sha256 "23171da308c1d99272a05a3ef639ea5108b7d06544d336dac445777c6ac8da8e"
  license "MIT"

  depends_on "git"
  depends_on "node"

  resource "skillshare" do
    version "0.30.8"
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/runkids/skillshare/releases/download/v0.30.8/skillshare_0.30.8_darwin_arm64.tar.gz"
        sha256 "73f0b0b7114cf42cefda795107a06252bbb9e10751d6addb174cd8b9a5a979c7"
      else
        url "https://github.com/runkids/skillshare/releases/download/v0.30.8/skillshare_0.30.8_darwin_amd64.tar.gz"
        sha256 "6ca0fb91c837eaa082c325683081ad6c3e65a78bba4ff0226a77f6ef368eb2c2"
      end
    elsif Hardware::CPU.arm?
      url "https://github.com/runkids/skillshare/releases/download/v0.30.8/skillshare_0.30.8_linux_arm64.tar.gz"
      sha256 "6d35bef34e8a34a4111a533d4fbfe3ad56a8cf67670dfb44aaef2ee3d2d454a3"
    else
      url "https://github.com/runkids/skillshare/releases/download/v0.30.8/skillshare_0.30.8_linux_amd64.tar.gz"
      sha256 "5bd99d0677171d619009f49464aabcb3fadd86b7e87b85eb66b40476b9cffe5e"
    end
  end

  def install
    libexec.install "bin", "dist", "package.json", "README.md", "LICENSE", "THIRD_PARTY_NOTICES.md"
    resource("skillshare").stage do
      (libexec/"vendor").install "skillshare"
      (libexec/"vendor").install "LICENSE" => "skillshare-LICENSE" if File.exist?("LICENSE")
    end
    (bin/"agent-backbone").write <<~EOS
      #!/bin/sh
      export AGENT_BACKBONE_COMMAND="#{HOMEBREW_PREFIX}/bin/agent-backbone"
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"agent-backbone"
  end

  def caveats
    <<~EOS
      Configure your source after installation:
        agent-backbone configure OWNER/REPOSITORY
      Homebrew installs the generic tool only; configuration is explicit.
    EOS
  end

  test do
    assert_equal "agent-backbone #{version}", shell_output("#{bin}/agent-backbone --version").strip
    assert_match "configure", shell_output("#{bin}/agent-backbone --help")
    assert_match "skillshare v0.30.8", shell_output("#{libexec}/vendor/skillshare version")
  end
end
