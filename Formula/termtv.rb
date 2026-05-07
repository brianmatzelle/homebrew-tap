class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.1.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.1.0/termtv-v0.1.0-macos-arm64.tar.gz"
      sha256 "2bdec1a57945f4ca864168142a993ed710122af32834f2e4ffd831831ad0599a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.1.0/termtv-v0.1.0-linux-x86_64.tar.gz"
      sha256 "76885a4f87f467fe5911d8fc37b652177f0946df4171c4200e41f766a2315a5f"
    end
  end

  def install
    bin.install "termtv"
  end

  test do
    assert_predicate bin/"termtv", :executable?
  end
end
