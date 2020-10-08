class DoctaveCli < Formula
  desc "Opinionated developer documentation site generator"
  homepage "https://cli.doctave.com"
  url "https://github.com/Doctave/doctave-cli/archive/0.1.0.tar.gz"
  sha256 "9189ea200bf1a26017161e42d1640839c3b998721315ae23ef4bc3ba8ed3eed1"
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
