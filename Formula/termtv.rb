class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.6.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.0/termtv-v0.6.0-macos-arm64.tar.gz"
      sha256 "02245cac38f4c3b209dcb67301fa4a4fd3a4663b0490f89eae2204c3cc9353a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.0/termtv-v0.6.0-linux-x86_64.tar.gz"
      sha256 "c5f24964eb69f6a10e66a8bb69bc9f8aaa863ffffc607b3d8fa37a5e224e7a61"
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
