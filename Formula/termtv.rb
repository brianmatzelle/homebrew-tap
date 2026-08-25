class Termtv < Formula
  desc "Terminal IPTV browser — mpv in a PTY, Textual TUI"
  homepage "https://github.com/brianmatzelle/tv-releases"
  version "0.11.0"

  # Only arm64 targets ship: macOS (Apple Silicon), built from `main`, and
  # Linux aarch64, built from the `linux-aarch64` branch. Intel Linux is
  # deliberately not shipped rather than shipped untested; this requirement
  # gives those hosts a clear "arm64 is required" message instead of a
  # confusing download failure.
  depends_on arch: :arm64
  depends_on "mpv"

  on_macos do
    url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.11.0/termtv-v0.11.0-macos-arm64.tar.gz"
    sha256 "ee4b9fc182791c3ba5a36e65db8c29eef854f49348a4b539b53f143e6013f295"
  end

  on_linux do
    url "https://github.com/brianmatzelle/tv-releases/releases/download/v0.11.0/termtv-v0.11.0-linux-aarch64.tar.gz"
    sha256 "6fe28a9634cc6eb2b4fbb3ee32803bbb14ca85b993bbd5dd3412092f60d25acd"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"termtv"
  end

  test do
    assert_predicate bin/"termtv", :executable?
  end
end
