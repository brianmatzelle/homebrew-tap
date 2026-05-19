class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.8.1"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.8.1/termtv-v0.8.1-macos-arm64.tar.gz"
      sha256 "48a637263c8e3fa961bad521391cc22acedb4e4bccf40916d340f330cb0a32cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.8.1/termtv-v0.8.1-linux-x86_64.tar.gz"
      sha256 "464c1f01b91ab919732a7d60bae525be3f4d1dd8fc34a36b40a72ad13364ea27"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.8.1/termtv-v0.8.1-linux-aarch64.tar.gz"
      sha256 "10f2bc4b9f6b6e80cd072076012cb26e86d10c65f2cded85e7ca6f9117fef2a3"
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
