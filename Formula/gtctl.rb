class Gtctl < Formula
  desc "gtctl is a command-line tool for managing GreptimeDB cluster."
  homepage "https://github.com/GreptimeTeam/gtctl"
  version "v0.1.0-beta.1"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.1/gtctl-darwin-amd64.tgz"
    sha256 "074d402c465c4f4c44325a419b9a9a0ff4ce474c0bf60a367e0ac2daaa9ae2d8"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.1/gtctl-darwin-arm64.tgz"
    sha256 "1505f02b30e72d9179675c97136457a9118d61d28669f7a8778b2ba71d8a092d"
  end

  def install
    bin.install "gtctl"
  end
end
