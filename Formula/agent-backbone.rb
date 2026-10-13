class AgentBackbone < Formula
  desc "Sync skills and shared agent instructions from your Git repository"
  homepage "https://github.com/notsuhas/agent-backbone"
  url "https://github.com/notsuhas/agent-backbone/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "159c078089dd26ac6ada1c36719e8376caeb8b420f0b850d0bc57fb15a33dfc3"
  license "MIT"

  depends_on "git"
  depends_on "python@3.14"

  resource "skillshare" do
    version "0.25.10"
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/runkids/skillshare/releases/download/v0.25.10/skillshare_0.25.10_darwin_arm64.tar.gz"
        sha256 "1f6ada0546d4007d6520fb063e8f2dcb00f3e1833a26845ed7a96f8f59cfd46f"
      else
        url "https://github.com/runkids/skillshare/releases/download/v0.25.10/skillshare_0.25.10_darwin_amd64.tar.gz"
        sha256 "399a2e82d08423080c4cf797ff68e566b08c4e6ed3d42c5d34af4b02dc8ac7fb"
      end
    elsif Hardware::CPU.arm?
      url "https://github.com/runkids/skillshare/releases/download/v0.25.10/skillshare_0.25.10_linux_arm64.tar.gz"
      sha256 "323544db97a37a59969f29c9c1a87fa0278939ae7d40c92e4e5f28c55ca10060"
    else
      url "https://github.com/runkids/skillshare/releases/download/v0.25.10/skillshare_0.25.10_linux_amd64.tar.gz"
      sha256 "ce2220d8a32e01ae319dda4a3ce8db10e90a5c9fd67fc2a0995d4e6e40e50d29"
    end
  end

  def install
    libexec.install "bin", "lib", "README.md", "LICENSE"
    resource("skillshare").stage do
      (libexec/"vendor").install "skillshare"
      (libexec/"vendor").install "LICENSE" => "skillshare-LICENSE" if File.exist?("LICENSE")
    end
    (bin/"agent-backbone").write <<~EOS
      #!/bin/sh
      export AGENT_BACKBONE_COMMAND="#{HOMEBREW_PREFIX}/bin/agent-backbone"
      exec "#{Formula["python@3.14"].opt_bin}/python3.14" "#{libexec}/bin/agent-backbone" "$@"
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
    assert_match "skillshare v0.25.10", shell_output("#{libexec}/vendor/skillshare version")
  end
end
