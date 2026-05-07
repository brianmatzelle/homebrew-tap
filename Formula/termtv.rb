class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.3.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.3.0/termtv-v0.3.0-macos-arm64.tar.gz"
      sha256 "9df09018ab43c57d47559b4327c5b6f0906447ca7bfcd01d2d4ccbac2e1bc772"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.3.0/termtv-v0.3.0-linux-x86_64.tar.gz"
      sha256 "3807b856e82d65a0e79d4268ed5a8a8fe704dcc98b11946cfa02494ce442473f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"termtv"
  end

  test do
    assert_predicate bin/"termtv", :executable?
  end
end
