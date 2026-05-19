class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.7.3"

  depends_on "mpv"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.3/termtv-v0.7.3-macos-arm64.tar.gz"
      sha256 "b19e9e557828369f53941fcd5ed44e2643c9a6b63b0833bf6350e28172cdd6cd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.3/termtv-v0.7.3-linux-x86_64.tar.gz"
      sha256 "1bd35d3dc31e7702bc066d4f048936f7b0c453b0c558da25259a4bb573972dbe"
    elsif Hardware::CPU.arm?
      url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.7.3/termtv-v0.7.3-linux-aarch64.tar.gz"
      sha256 "a0d886a0087774addf7afb7b6c90cb5d06596776d9061b89ae5a625d29810cd1"
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
