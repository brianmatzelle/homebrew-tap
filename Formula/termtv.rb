class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.7.1"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.1/termtv-v0.7.1-macos-arm64.tar.gz"
      sha256 "5d0d77437f1c9a6006cda9253328450b456b69e118a8ae5010fcb17f2f074553"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.1/termtv-v0.7.1-linux-x86_64.tar.gz"
      sha256 "27f383aa3e7ee4e442df0d850dd325359708c8329dcd1e08bd4fecbbf0324deb"
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
