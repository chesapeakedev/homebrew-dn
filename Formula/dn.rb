# typed: false
# frozen_string_literal: true

class Dn < Formula
  desc "CLI for working systematically alongside coding agents"
  homepage "https://docs.denoise.cloud/dn-cli/installation/"
  version "0.0.47"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/chesapeakedev/dn/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-arm64",
          using: :nounzip
      sha256 "fa69c52dd0cf6d553730e3004630bffeec502fc67b8b138f28252cd0a19ce65b"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-macos-x64",
          using: :nounzip
      sha256 "e14b044be0e7b70a047547d233350999ecb09a9ffb4e835537b17d5c43b24617"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-arm64",
          using: :nounzip
      sha256 "b8d5671f94dba64e87506c634f4e50befc41674d3e66643968b05fb2e7a724a0"
    end
    on_intel do
      url "https://github.com/chesapeakedev/dn/releases/download/v#{version}/dn-linux-x64",
          using: :nounzip
      sha256 "ad88cc26cdd7eb6b9ac44cfc1af7184ba5651c7ac5b215a9e65390bee0473877"
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
