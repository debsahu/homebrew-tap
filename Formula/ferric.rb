class Ferric < Formula
  desc "Open-source Rust + WebGPU NMR resonance assignment, dynamics & chemometrics CLI"
  homepage "https://debsahu.github.io/ferric/"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-arm64.tar.gz"
      sha256 "27ef1ebc534d89d7c943d6e7ce2bd09ec3fa7a552a92e5f1c88452f2b27f302e"
    end

    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-x86_64.tar.gz"
      sha256 "8fab043b6c37e37b06cda5317f22c48e0c013cd39f904c71656b82a0879da87b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-linux-x86_64.tar.gz"
      sha256 "6549854fc1aea9d6e96145fa76f354c2838755f5312eccf521c58436ee0b72c9"
    end
  end

  def install
    bin.install "bin/ferric"
    bin.install "bin/ferric-gui" if File.exist?("bin/ferric-gui")
    doc.install "README.md" if File.exist?("README.md")
    doc.install "THIRD_PARTY.md" if File.exist?("THIRD_PARTY.md")
  end

  def caveats
    <<~EOS
      To also install the native macOS desktop workbench (FERRIC.app):
        brew install --cask debsahu/tap/ferric
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ferric --version")
  end
end
