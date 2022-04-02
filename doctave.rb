class Doctave < Formula
  desc "Opinionated developer documentation site generator"
  homepage "https://cli.doctave.com"
  url "https://github.com/Doctave/doctave/archive/0.4.2.tar.gz"
  sha256 "8994529738ec9b39d35f916a081f021e481f068546512813e41af8337a4eab97"
  license "MIT"

  livecheck do
    url "https://github.com/doctave/doctave-cli/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/doctave init"
    assert_predicate testpath/"docs", :exist?
  end
end
