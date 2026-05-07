class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.2.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.2.0/termtv-v0.2.0-macos-arm64.tar.gz"
      sha256 "d9477711a9f4a5de0cd690392cd69f0753ceb7f41b2d07e58ebcdd12feb9d07e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.2.0/termtv-v0.2.0-linux-x86_64.tar.gz"
      sha256 "949fb90605fafc822cf726e9314e10e89f94f6e3967e3c54dde78dcd2b3b4a69"
    end
  end

  def install
    bin.install "termtv"
  end

  test do
    assert_predicate bin/"termtv", :executable?
  end
end
