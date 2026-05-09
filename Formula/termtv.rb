class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.6.3"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.3/termtv-v0.6.3-macos-arm64.tar.gz"
      sha256 "b2ed26cdf8c3353a4a9eed6864d35f7ef83f6a2167baeb1a396002c67d3804a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.6.3/termtv-v0.6.3-linux-x86_64.tar.gz"
      sha256 "1204aa04294bf7e20fc576ff086dcb15fa2313a49eb317ecde9df54a80cf4ab2"
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
