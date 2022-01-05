class Doctave < Formula
  desc "Opinionated developer documentation site generator"
  homepage "https://cli.doctave.com"
  url "https://github.com/Doctave/doctave/archive/0.4.1.tar.gz"
  sha256 "e1fd55219a5068c36de03c82c7e8b2b49506f15b564bd50a795a3e79ecb3a784"
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
