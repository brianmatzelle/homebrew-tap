class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.2.1"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.2.1/termtv-v0.2.1-macos-arm64.tar.gz"
      sha256 "78ffed9fd1d4b69e36c5afcb3eccce861086797dea5ecb64a280a97ca64b43be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.2.1/termtv-v0.2.1-linux-x86_64.tar.gz"
      sha256 "45cb973550437bcb720c3543ee37c7328bd5fcbeb2f00ee49ac50f1418104b4e"
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
