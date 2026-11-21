class Ferric < Formula
  desc "Open-source Rust + WebGPU NMR resonance assignment, dynamics & chemometrics CLI"
  homepage "https://debsahu.github.io/ferric/"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-arm64.tar.gz"
      sha256 "9cc733f9e0a55e697538efc8976bfcc0826ce2f84e72ac764971a3c800a22c7d"
    end

    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-x86_64.tar.gz"
      sha256 "27f7d8bee51d810b6df8c9ad95067f728616fc84f62d30bba4973ee56ec309af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-linux-x86_64.tar.gz"
      sha256 "eda1c5321f0edc0ac2b1f9dc171e4fc094b6ba82c1a49515e14d600b2078cd88"
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
