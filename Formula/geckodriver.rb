class Geckodriver < Formula
  desc "WebDriver <-> Marionette proxy"
  homepage "https://github.com/mozilla/geckodriver"
  url "https://github.com/mozilla/geckodriver/archive/v0.10.0.tar.gz"
  sha256 "bdbdd9e01831d48afeb324cf5c8f02aadad5bd30e4308e3fb34a07b596c547f5"

  bottle do
    cellar :any_skip_relocation
    sha256 "52b96ce3c70ef4f25c1132abe049f7089b38c4576eef6dcf9ca0a74009111392" => :el_capitan
    sha256 "021aec27053becf994df7bf13b34d412746b7d038c05de82e74e39eb4acef630" => :yosemite
    sha256 "111bc1ec1e89396a4a422ce0de16a292bc9b5da2b246c4648e65af42f36006b2" => :mavericks
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build"
    bin.install "target/debug/geckodriver"
    bin.install_symlink bin/"geckodriver" => "wires"
  end

  test do
    system bin/"geckodriver", "--help"
  end
end
