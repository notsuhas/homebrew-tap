class AgentBackbone < Formula
  desc "Automatic refresh and complete-plugin delivery for Skillshare"
  homepage "https://github.com/notsuhas/agent-backbone"
  url "https://github.com/notsuhas/agent-backbone/releases/download/v0.7.1/agent-backbone-0.7.1.tgz"
  sha256 "d57b824d396b5e70f5f895324d1e3c6386e1dafe4e4970a366f1deed08af92f1"
  license "MIT"

  depends_on "git"
  depends_on "node@22"

  resource "skillshare" do
    version "0.25.11"
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/runkids/skillshare/releases/download/v0.25.11/skillshare_0.25.11_darwin_arm64.tar.gz"
        sha256 "4e7bec76c49fea9cacef3076cc7b668262ca3655eac3583872f870d2dc4fc496"
      else
        url "https://github.com/runkids/skillshare/releases/download/v0.25.11/skillshare_0.25.11_darwin_amd64.tar.gz"
        sha256 "783903b2d6e7e357678a7ac9a61bf10e673cc572aa2c1b1619b17fe02258ea0d"
      end
    elsif Hardware::CPU.arm?
      url "https://github.com/runkids/skillshare/releases/download/v0.25.11/skillshare_0.25.11_linux_arm64.tar.gz"
      sha256 "562e8f8ebd06df200e1e56266cdad3822781d183ae6696d7b09e37b2e6003994"
    else
      url "https://github.com/runkids/skillshare/releases/download/v0.25.11/skillshare_0.25.11_linux_amd64.tar.gz"
      sha256 "2ae0f8fce4ecd79be6ff44cc6423d03fbd80ac89b825104bae1afc9580a66b5d"
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
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
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
    assert_match "skillshare v0.25.11", shell_output("#{libexec}/vendor/skillshare version")
  end
end
