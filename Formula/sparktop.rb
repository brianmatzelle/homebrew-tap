class Sparktop < Formula
  include Language::Python::Shebang

  desc "Live, top-style GPU monitor for the NVIDIA DGX Spark (GB10)"
  homepage "https://github.com/brianmatzelle/sparktop"
  url "https://github.com/brianmatzelle/sparktop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "db8790b8d6d633651b77799dd2133827985b61dd17bfc0c24ca1fbda7c8b6b1b"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Pure stdlib single-file script; just point its shebang at our Python.
    rewrite_shebang detected_python_shebang, "sparktop"
    bin.install "sparktop"
  end

  test do
    # sparktop reads telemetry from nvidia-smi; point it at a stub so the
    # test works on machines without an NVIDIA GPU. The GPU line has to match
    # GPU_FIELDS column-for-column, so asserting on a late field (pstate)
    # catches field-list drift, not just "the thing ran".
    (testpath/"fake-nvidia-smi").write <<~EOS
      #!/bin/sh
      case "$1" in
        --query-compute-apps=*) echo "4242, python3, 2048" ;;
        *) echo "0, NVIDIA GB10, 580.00, 45, 12, 8, 131072, 16384, 114688, 60.0, 280, 1500, P0" ;;
      esac
    EOS
    chmod 0755, testpath/"fake-nvidia-smi"
    output = shell_output(
      "SPARKTOP_NVIDIA_SMI=#{testpath}/fake-nvidia-smi #{bin}/sparktop --once --no-color"
    )
    assert_match "NVIDIA GB10", output
    assert_match "P-state P0", output
    assert_match "python3", output
  end
end
