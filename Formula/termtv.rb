class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.10.0"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.10.0/termtv-v0.10.0-macos-arm64.tar.gz"
      sha256 "b05ab3656ab10d5aa64eb5278022324a4a576eafb69a76ac8badbd6175548766"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.10.0/termtv-v0.10.0-linux-x86_64.tar.gz"
      sha256 "0806afe6abab234fa1def55bda8043c1e8622468c458cd0a353d4048fd45ec00"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.10.0/termtv-v0.10.0-linux-aarch64.tar.gz"
      sha256 "9eaf361a3f71a8d4c378993fbfe0728715331da2e9af66ab450bce054b159669"
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
