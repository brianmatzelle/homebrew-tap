class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.5.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.5.0/termtv-v0.5.0-macos-arm64.tar.gz"
      sha256 "14e8779f8bafc6d42224528c521e82b889dc4f63dce51128569600bb35160f07"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.5.0/termtv-v0.5.0-linux-x86_64.tar.gz"
      sha256 "b8f035e033709f20d9b2151dd688548957d4620b946d62cd982ba50c6752bf47"
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
