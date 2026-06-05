class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.9.1"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.1/termtv-v0.9.1-macos-arm64.tar.gz"
      sha256 "45ec03c159d3d80d02dd314027459ca352c2f61dd871ab8cd3d3f0d239633766"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.1/termtv-v0.9.1-linux-x86_64.tar.gz"
      sha256 "232788ed4a5a4b953f7d1492a5357dd930766bc064898c98895e86e7aaffa5aa"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.1/termtv-v0.9.1-linux-aarch64.tar.gz"
      sha256 "8780ae3c277957a172b2d38917031f7b4c206de9850206612d52a2696b8cc3b5"
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
