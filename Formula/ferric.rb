class Ferric < Formula
  desc "Open-source Rust + WebGPU NMR resonance assignment, dynamics & chemometrics CLI"
  homepage "https://debsahu.github.io/ferric/"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-arm64.tar.gz"
      sha256 "ffd79c4a2222ef8380c28da2904b0f417746cde1e083d61207238dc882277f41"
    end

    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-x86_64.tar.gz"
      sha256 "46d02c678023f605a2cf833483c01c980032997904276bf56a4da11132dad13d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-linux-x86_64.tar.gz"
      sha256 "95e15f83a6056587baf49c54fccd7831c8da914aef875b480467992497ffb645"
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
