class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.6.2"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.2/termtv-v0.6.2-macos-arm64.tar.gz"
      sha256 "56beb29684fe07b6fd466fedd373341513247c9d5ef40246c36054f719ef4d5d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.2/termtv-v0.6.2-linux-x86_64.tar.gz"
      sha256 "69713b54712c12db63a66f08487e457792cf7ccefead19cea17e200f176fbad1"
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
