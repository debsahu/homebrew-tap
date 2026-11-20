class Ferric < Formula
  desc "Open-source Rust + WebGPU NMR resonance assignment, dynamics & chemometrics CLI"
  homepage "https://debsahu.github.io/ferric/"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-arm64.tar.gz"
      sha256 "03ad81646c6c37231fb7c7fe9274dfb520fb41d068ef17cd5f85e0de7f0c208c"
    end

    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-x86_64.tar.gz"
      sha256 "a77511ae43f4e65382f7e1682f6dbff822bdd745341c338536e9979ac82bf4b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-linux-x86_64.tar.gz"
      sha256 "93850dfc957ed2978dd6d665574f80f0ff21ceb53348dc7d72b7cdda5c16e572"
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
