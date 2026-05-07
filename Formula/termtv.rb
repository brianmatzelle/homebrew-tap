class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.4.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.4.0/termtv-v0.4.0-macos-arm64.tar.gz"
      sha256 "6d93287f363641573a7c8052bcac9f9b2117ff1c81b26cc8ad9d176990380e74"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.4.0/termtv-v0.4.0-linux-x86_64.tar.gz"
      sha256 "f6fd7a7bca8fd6367a316c01d45da956ad10a2140e1c23c7fcc49699a391cab5"
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
