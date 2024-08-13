class Gtctl < Formula
  desc "gtctl is a command-line tool for managing GreptimeDB cluster."
  homepage "https://github.com/GreptimeTeam/gtctl"
  version "v0.1.0-beta.11"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.11/gtctl-darwin-amd64.tgz"
    sha256 "c8d61b8ee32e42697624bf40e0e63b8fb49aa6b00030751d6c1f922d0ccd003e"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.11/gtctl-darwin-arm64.tgz"
    sha256 "3dd81cb8f0e05cded36e30add114bd02146c743127178471561ba0e5bab8b067"
  end

  def install
    bin.install "gtctl"
  end
end

