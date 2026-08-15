class Folios < Formula
  desc "Cinematic command-line workspace for Folios"
  homepage "https://folios.works"
  url "https://github.com/FriskyDevelopments/folios-cli/releases/download/cli-v0.1.0/folios-cli-0.1.0.tgz"
  version "0.1.0"
  sha256 "de95640b1767d199f88b4b72fa5fc07692f2ba8fd51634f43b4b3d0d3ec869a8"
  license :cannot_represent

  depends_on "node"

  def install
    root = (buildpath/"package").directory? ? buildpath/"package" : buildpath
    libexec.install root/"bin", root/"src", root/"package.json", root/"README.md"
    bin.install_symlink libexec/"bin/folios.js" => "folios"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/folios --version")
    assert_match '"command": "help"', shell_output("#{bin}/folios --json help")
  end
end
