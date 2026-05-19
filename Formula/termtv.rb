class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.7.4"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.4/termtv-v0.7.4-macos-arm64.tar.gz"
      sha256 "95f11692fe72c826a3ba097663d20514aa8473358ca2b243ddaac44705fd07fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.4/termtv-v0.7.4-linux-x86_64.tar.gz"
      sha256 "faf046ac35289e1dda3cefee58d10f1e8fdb6dcbc62b8a5582fc1757602629ab"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.4/termtv-v0.7.4-linux-aarch64.tar.gz"
      sha256 "a2aa3dd38ae963cbf979c74728a71311643ffa8257598fbe4e0ea8b7890bded8"
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
