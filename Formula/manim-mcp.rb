class ManimMcp < Formula
  include Language::Python::Virtualenv

  desc "Manim MCP server + always-on terminal stream pane (the banim CLI)"
  homepage "https://github.com/brianmatzelle/banim"
  url "https://github.com/brianmatzelle/banim/releases/download/v0.3.0/manim_mcp-0.3.0.tar.gz"
  sha256 "6092684e6baf5b1769778a7d8cc19aac9928361698b43c2104a8914eb9e02dee"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "ffmpeg"
  depends_on "manim"
  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Set up ~/.config/manim-mcp, optional LaTeX, and register the MCP
      server with your harness (Claude Code / OpenCode):
        banim init

      Then keep a stream pane open beside your agent:
        banim stream

      It renders real pixels on kitty, Ghostty and WezTerm, and falls back
      to sub-cell glyphs anywhere else — tmux included, so prefer a native
      split if you want the pixels.
    EOS
  end

  test do
    assert_match "banim #{version}", shell_output("#{bin}/banim --version")
  end
end
