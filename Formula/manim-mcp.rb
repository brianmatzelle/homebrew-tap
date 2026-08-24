class ManimMcp < Formula
  include Language::Python::Virtualenv

  desc "Manim MCP server + always-on terminal stream pane for coding agents"
  homepage "https://github.com/brianmatzelle/manim-mcp"
  # Local-dev URL; swap for the GitHub release tarball when publishing:
  #   url "https://github.com/brianmatzelle/manim-mcp/releases/download/v0.1.0/manim_mcp-0.1.0.tar.gz"
  url "file:///home/cowboy/projects/active/manim-mcp/dist/manim_mcp-0.1.0.tar.gz"
  sha256 "91406e4691296d715ed05ae17eeee68b2df3cafea9be8b4daab7c14dabc17eeb"
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
      Create ~/.config/manim-mcp and register the MCP server with your
      harness (Claude Code / OpenCode):
        manim-mcp init

      Then keep a stream pane open in tmux:
        tmux split-window -h 'manim-mcp watch'
    EOS
  end

  test do
    assert_match "manim-mcp #{version}", shell_output("#{bin}/manim-mcp --version")
  end
end
