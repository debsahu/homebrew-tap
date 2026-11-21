cask "ferric" do
  arch arm: "arm64", intel: "x86_64"

  version "0.17.2"
  sha256 arm:   "99754ded02d5ec8202af285eb879237b3633aba9cef9c23f1b840d77416fe370",
         intel: "4164e40c299b3c5ecd9f341aa5f107b26c09a44e6a3f5267dc1199dd9e679fda"

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
