class Concurrently < Formula
  desc "Concurrent subagent workflow TUI — like Claude Code, but parallel"
  homepage "https://github.com/brianmatzelle/concurrently-releases"
  url "https://github.com/brianmatzelle/concurrently-releases/releases/download/v0.1.1/concurrently-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "b3f32509c1f4d3701265eee1ecac6d9a8e7fc3b4814b371adbf73d2fbbb97f6d"
  version "0.1.1"
  license "MIT"

  def install
    bin.install "concurrently"
  end

  test do
    assert_match "concurrently", shell_output("#{bin}/concurrently --help 2>&1", 1)
  end
end
