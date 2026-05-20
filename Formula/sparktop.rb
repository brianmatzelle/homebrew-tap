class Sparktop < Formula
  include Language::Python::Shebang

  desc "Live, top-style GPU monitor for the NVIDIA DGX Spark (GB10)"
  homepage "https://github.com/brianmatzelle/sparktop"
  url "https://github.com/brianmatzelle/sparktop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "28c166a6d3390777c2f4c4a523bb8480614ee16a0633fc9bad1e2d68549f669b"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Pure stdlib single-file script; just point its shebang at our Python.
    rewrite_shebang detected_python_shebang, "sparktop"
    bin.install "sparktop"
  end

  test do
    # sparktop reads telemetry from nvidia-smi; point it at a stub so the
    # test works on machines without an NVIDIA GPU.
    (testpath/"fake-nvidia-smi").write <<~EOS
      #!/bin/sh
      echo "0, NVIDIA GB10, 580.00, 45, 12, 8, 131072, 16384, 114688, 60.0, 280, 1500, 8000, 30, P0"
    EOS
    chmod 0755, testpath/"fake-nvidia-smi"
    output = shell_output(
      "SPARKTOP_NVIDIA_SMI=#{testpath}/fake-nvidia-smi #{bin}/sparktop --once --no-color"
    )
    assert_match "NVIDIA GB10", output
  end
end
