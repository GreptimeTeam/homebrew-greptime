class Gtctl < Formula
  desc "gtctl is a command-line tool for managing GreptimeDB cluster."
  homepage "https://github.com/GreptimeTeam/gtctl"
  version "v0.1.0-beta.8"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.8/gtctl-darwin-amd64.tgz"
    sha256 "73d478d0a7a2d1db4c71220593f45bb996f3ac497a8e00af003d11d79de6ce11"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/gtctl/releases/download/v0.1.0-beta.8/gtctl-darwin-arm64.tgz"
    sha256 "0819733989a0a145229cd638f13989053ad55c8eb35b15a15e2175bcdd5259b9"
  end

  def install
    bin.install "gtctl"
  end
end

