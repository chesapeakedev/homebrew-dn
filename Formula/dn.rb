# typed: false
# frozen_string_literal: true

class Dn < Formula
  desc "CLI for working systematically alongside coding agents"
  homepage "https://docs.denoise.cloud/dn-cli/installation/"
  version "0.0.36"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/chesapeakedev/dn/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-arm64",
          using: :nounzip
      sha256 "0d68d0776a567f8053c850955b6e43ff61654355532b8e84563ae4f201a43357"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-x64",
          using: :nounzip
      sha256 "d8f6d036f9e53adba3bb155dc47d47b1116fe17005ef11cf986c09f18f71a989"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-arm64",
          using: :nounzip
      sha256 "afb9ac9ed9dcbb45e542eccad93ed7488c88ef7eac7d367938a285630f069a6a"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-x64",
          using: :nounzip
      sha256 "47a585c2223fcfdb9f68717c39e5bf91be0251181dc62b3f3c419f81912d5b4e"
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
