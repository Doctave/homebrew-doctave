class Doctave < Formula
  desc "Opinionated developer documentation site generator"
  homepage "https://cli.doctave.com"
  url "https://github.com/Doctave/doctave/archive/0.3.0.tar.gz"
  sha256 "3d4350662469273cff460635e6d4baef4f38db9d757a42a8c9b26624507e5d6f"
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
