class Sendy < Formula
  desc "Command-line client for sendy.md — paste terminal output, get a markdown link"
  homepage "https://sendy.md"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Achronon/sendy-md/releases/download/cli-v#{version}/sendy-darwin-arm64"
      sha256 "404d7799022a851e4a4d6646c356825a15ab48816ed690be559a52474d6ed13d"
    end
    on_intel do
      url "https://github.com/Achronon/sendy-md/releases/download/cli-v#{version}/sendy-darwin-amd64"
      sha256 "97701cbe441ac63d5141d12b4235fbb18372228d79d421b40c9c384fb7418bfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Achronon/sendy-md/releases/download/cli-v#{version}/sendy-linux-arm64"
      sha256 "bb861be52d5ef1de3958fe282c0931ad018effa9847e82b78424fcc7b8ed7f6e"
    end
    on_intel do
      url "https://github.com/Achronon/sendy-md/releases/download/cli-v#{version}/sendy-linux-amd64"
      sha256 "5744eff4a69e830251f49cd39aa1a90808dd966d963cf295149be6974754fee1"
    end
  end

  def install
    # Release assets are named by platform (sendy-<os>-<arch>). Rename
    # to plain `sendy` so it lands in Cellar as the expected binary.
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "sendy-#{os}-#{arch}" => "sendy"
  end

  def caveats
    <<~EOS
      Shell completions can be installed with:
        sendy completions bash > $(brew --prefix)/etc/bash_completion.d/sendy
        sendy completions zsh  > $(brew --prefix)/share/zsh/site-functions/_sendy
        sendy completions fish > ~/.config/fish/completions/sendy.fish
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sendy version").strip
    assert_match "Usage:", shell_output("#{bin}/sendy help")
  end
end
