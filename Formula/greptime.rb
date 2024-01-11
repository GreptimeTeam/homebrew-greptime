class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.5.1"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.5.1/greptime-darwin-amd64-v0.5.1.tar.gz"
    sha256 "7a2fa8b392d01cf4dfebd1d42fe8f66ed75c95c922ba217ec09521918855d1bb"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.5.1/greptime-darwin-arm64-v0.5.1.tar.gz"
    sha256 "bf637040fa914f7087fb04f78f7b036e9e1c577573a51e184753a7bbeb6fff19"
  end

  def install
    bin.install "greptime"
  end
end

