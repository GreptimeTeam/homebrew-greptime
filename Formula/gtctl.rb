class Gtctl < Formula
  desc "gtctl is a command-line tool for managing GreptimeDB cluster."
  homepage "https://github.com/GreptimeTeam/gtctl"
  version "v0.1.0-beta.5"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.5/gtctl-darwin-amd64.tgz"
    sha256 "43fe7644ea2cfdea50b1dc991a154f9586457691f9d98e524d5249117a278211"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.5/gtctl-darwin-arm64.tgz"
    sha256 "8383c8017f4d4b451668383b40956d33873191ef09081a6eadfe98df25d62d09"
  end

  def install
    bin.install "gtctl"
  end
end

