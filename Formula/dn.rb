# typed: false
# frozen_string_literal: true

class Dn < Formula
  desc "CLI for working systematically alongside coding agents"
  homepage "https://docs.denoise.cloud/dn-cli/installation/"
  version "0.0.41"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/chesapeakedev/dn/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-arm64",
          using: :nounzip
      sha256 "395c4884efbd5929173e1118866c0e8ff173973c38cc5ae6551f3c4400d5a9e8"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-x64",
          using: :nounzip
      sha256 "d4fa901ef0b48fd2de77a4cd1c14c5e12dbd975d47eeb23384bea6eda10b6f90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-arm64",
          using: :nounzip
      sha256 "087050dff9f4d161041ed1edd58ab843bcd7eca0cc0fc726a4a288115582c681"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-x64",
          using: :nounzip
      sha256 "b6553a96ac5c7574d7e80c1934a9c728f0657e574ac2eca7351eef8bdf12f6c0"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "dn-macos-arm64" : "dn-macos-x64"
    elsif Hardware::CPU.arm?
      "dn-linux-arm64"
    else
      "dn-linux-x64"
    end

    chmod 0755, binary
    bin.install binary => "dn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dn --version")
    assert_match "kickstart", shell_output("#{bin}/dn --help 2>&1")
  end
end
