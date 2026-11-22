cask "ferric" do
  arch arm: "arm64", intel: "x86_64"

  version "0.18.0"
  sha256 arm:   "ad9cc759a4a0aa6718a7db992c17e42d72240e5707ca2f491ec0a3668d767aca",
         intel: "47183cf0a320ca42abe319d09e41968f5391a6e3629f884872e2cfc464be4254"

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
