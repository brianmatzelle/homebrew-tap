class Concurrently < Formula
  desc "Concurrent subagent workflow TUI — like Claude Code, but parallel"
  homepage "https://github.com/brianmatzelle/concurrently"
  url "https://github.com/brianmatzelle/concurrently/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ab9ed7e9f9978c911299adf9f81eb5cb5e8739b33adf550b79e2465e3b750798"
  license "MIT"

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "concurrently", shell_output("#{bin}/concurrently --help 2>&1", 1)
  end
end
