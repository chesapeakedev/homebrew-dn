# typed: false
# frozen_string_literal: true

class Dn < Formula
  desc "CLI for working systematically alongside coding agents"
  homepage "https://docs.denoise.cloud/dn-cli/installation/"
  version "0.0.44"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/chesapeakedev/dn/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-arm64",
          using: :nounzip
      sha256 "b369d13f20956c59856808654910d9087c9d1ae8bb029c6a89b2c902f204a4bb"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-x64",
          using: :nounzip
      sha256 "476d998406f7b477c4089e0be6159b0f3cfdfdcc2e4fae14c015afad0cce9127"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-arm64",
          using: :nounzip
      sha256 "7a424a65b173bde89804c354ad22509d7003c2ba478e071eeea001cc3b3d0a63"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-x64",
          using: :nounzip
      sha256 "c4aab057b4815ea7aa756de8a36282fcc913ec588de46a50f273a2a86baa3685"
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

  def post_install
    system "#{opt_bin}/dn", "runner", "install", "--if-present"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dn --version")
    assert_match "kickstart", shell_output("#{bin}/dn --help 2>&1")
  end
end
