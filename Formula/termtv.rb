class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.9.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.0/termtv-v0.9.0-macos-arm64.tar.gz"
      sha256 "45d34ba65e3df8bbc501467c82ee75a4aec95b8f4141b653ecc62436cdea57d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.0/termtv-v0.9.0-linux-x86_64.tar.gz"
      sha256 "0e12cb994e1e5e1b9bad01b211f91f6c87c0345e880d8df3fae75d4d094f2b41"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.9.0/termtv-v0.9.0-linux-aarch64.tar.gz"
      sha256 "9c98c8836e99713416382d1f881c66230fc7bca95f67ab8692538165207a9c95"
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
