class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.7.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.0/greptime-darwin-amd64-v0.7.0.tar.gz"
    sha256 "970739cfc66719d3bdfd18bbd38d412f3a375c106191fac246c5839f2b604f40"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.0/greptime-darwin-arm64-v0.7.0.tar.gz"
    sha256 "bb62a8755daed3a051a2d211bf7897285cff06238820e955c381d8f9838cbf8a"
  end

  def install
    bin.install "greptime"
  end
end

