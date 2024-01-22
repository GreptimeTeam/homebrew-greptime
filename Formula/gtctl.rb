class Gtctl < Formula
  desc "gtctl is a command-line tool for managing GreptimeDB cluster."
  homepage "https://github.com/GreptimeTeam/gtctl"
  version "v0.1.0-beta.9"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.9/gtctl-darwin-amd64.tgz"
    sha256 "19511c242b0a9f028227247439c261fd58bea1e0abe0ea62047d0248eb1bec24"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.9/gtctl-darwin-arm64.tgz"
    sha256 "db78316edd330c187e5478a4db06db82e54c2353112d38dd2a91853c604d5a61"
  end

  def install
    bin.install "gtctl"
  end
end

