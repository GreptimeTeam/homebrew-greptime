class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.4.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.0/greptime-darwin-amd64-v0.4.0.tar.gz"
    sha256 "e9f07576f50169baf2043c12ca104c322092c9245d7119edf8d9a52e25c76a58"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.0/greptime-darwin-arm64-v0.4.0.tar.gz"
    sha256 "4005cb0994dae806cc47fdf1f9cccd0a3ccacbf2d31414dc738f616ba7aec675"
  end

  def install
    bin.install "greptime"
  end
end

