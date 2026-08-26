class ManimMcp < Formula
  include Language::Python::Virtualenv

  desc "Manim MCP server + always-on terminal stream pane (the banim CLI)"
  homepage "https://github.com/brianmatzelle/banim"
  url "https://github.com/brianmatzelle/banim/releases/download/v0.3.1/manim_mcp-0.3.1.tar.gz"
  sha256 "9c7c6e7079b650b7e7080d926d2dc2bd38b1610961ce5f6fb48434ad7069d8f7"
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
