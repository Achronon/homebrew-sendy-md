class Sendy < Formula
  desc "Command-line client for sendy.md — paste terminal output, get a markdown link"
  homepage "https://sendy.md"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Achronon/sendy-cli/releases/download/v0.1.1/sendy-darwin-arm64"
      sha256 "02de998a4889fb2da69105fea2e20fde30b06333ea23dc8b486323d5f381a50b"
    end
    on_intel do
      url "https://github.com/Achronon/sendy-cli/releases/download/v0.1.1/sendy-darwin-amd64"
      sha256 "fbf7c2692f9a2d00b8003d46c4a359022b163cbff893ff057d8320256d0d1c0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Achronon/sendy-cli/releases/download/v0.1.1/sendy-linux-arm64"
      sha256 "2b2e7bf1b8b3e1e8c89f1530c84f2e614afe0030cd0c238e6fe434a00f3d5a9a"
    end
    on_intel do
      url "https://github.com/Achronon/sendy-cli/releases/download/v0.1.1/sendy-linux-amd64"
      sha256 "cc6cef46e60b7e3a2d0caad55114d0c2bd14ca09a054a56e6a4143d6fe879cc8"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "sendy-#{os}-#{arch}" => "sendy"
  end

  def caveats
    <<~CAVEAT
      Shell completions can be installed with:
        sendy completions bash > $(brew --prefix)/etc/bash_completion.d/sendy
        sendy completions zsh  > $(brew --prefix)/share/zsh/site-functions/_sendy
        sendy completions fish > ~/.config/fish/completions/sendy.fish
    CAVEAT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sendy version").strip
    assert_match "Usage:", shell_output("#{bin}/sendy help")
  end
end
