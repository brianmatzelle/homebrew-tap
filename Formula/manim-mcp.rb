class ManimMcp < Formula
  include Language::Python::Virtualenv

  desc "Manim MCP server + always-on terminal stream pane (the banim CLI)"
  homepage "https://github.com/brianmatzelle/banim"
  url "https://github.com/brianmatzelle/banim/releases/download/v0.2.2/manim_mcp-0.2.2.tar.gz"
  sha256 "3ea5755e35005315b0b52ea5d4f693b7996de2dc2faedb9ca0181cb721ec4c9c"
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

      Then keep a stream pane open in tmux:
        tmux split-window -h 'banim stream'
    EOS
  end

  test do
    assert_match "banim #{version}", shell_output("#{bin}/banim --version")
  end
end
