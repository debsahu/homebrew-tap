cask "ferric" do
  arch arm: "arm64", intel: "x86_64"

  version "0.17.1"
  sha256 arm:   "63ccbe0b37cc4e32b9bf5f239894909e7d041b310cb0745dbc0a4ac50055e2d1",
         intel: "1327ef5b0390a2574cbf1bb66b37fbeef44680649aa8a37a46b22fd6dc754921"

  url "https://github.com/debsahu/ferric/releases/download/v#{version}/ferric-v#{version}-macos-#{arch}.dmg"
  name "FERRIC"
  desc "Open-source Rust + WebGPU NMR resonance assignment, dynamics & chemometrics workbench"
  homepage "https://debsahu.github.io/ferric/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "FERRIC.app"
  binary "#{appdir}/FERRIC.app/Contents/MacOS/ferric"

  caveats <<~EOS
    FERRIC.app is ad-hoc signed (not Apple-notarized). If macOS Gatekeeper blocks first launch,
    install with `--no-quarantine` or remove the quarantine attribute once:
      xattr -dr com.apple.quarantine /Applications/FERRIC.app
  EOS
end
