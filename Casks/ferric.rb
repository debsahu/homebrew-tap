cask "ferric" do
  arch arm: "arm64", intel: "x86_64"

  version "0.17.3"
  sha256 arm:   "338535e64a2e5bc2abf7725873217699ee6116489898e13a8019c0195f1f4c23",
         intel: "a0028bb017bc629ce9ecd095d5fc795cf3384645e82684091e114f6f20aab9a0"

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
