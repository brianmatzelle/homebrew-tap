class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.7.2"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.2/termtv-v0.7.2-macos-arm64.tar.gz"
      sha256 "306bf82dd252f638479ab1d66c6d2fdf6ee6da64ee79e2bcf7e5cfb1caf2e79e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.2/termtv-v0.7.2-linux-x86_64.tar.gz"
      sha256 "b1d6667d2e8697c5260b7771a09fbee129e42a84020fb8a225d8de8d3d55610e"
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
