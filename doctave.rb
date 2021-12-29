class Doctave < Formula
  desc "Opinionated developer documentation site generator"
  homepage "https://cli.doctave.com"
  url "https://github.com/Doctave/doctave/archive/0.4.0.tar.gz"
  sha256 "ba3a176a82ef0f7194eb778d831502ac25621866be1ab1bf0c0fc874835e8094"
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
