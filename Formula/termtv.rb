class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.7.5"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.5/termtv-v0.7.5-macos-arm64.tar.gz"
      sha256 "3940959775816ba105599b32600941763983a7347a10252f5a48e8c710881efc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.5/termtv-v0.7.5-linux-x86_64.tar.gz"
      sha256 "85d7d0edab9449eff53cf94a29fdb50cdd30f6772781743be13dcb6124d09365"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.5/termtv-v0.7.5-linux-aarch64.tar.gz"
      sha256 "24afe73443ef5ff04286ec60551aa0067634c3822b2e63d85adae8163fc9688d"
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
