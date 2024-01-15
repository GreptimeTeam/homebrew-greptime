class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.6.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.6.0/greptime-darwin-amd64-v0.6.0.tar.gz"
    sha256 "34c40fbd215eb8f421f96c7fed7981995bdaf2431f8a9532ab42552d1025d089"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.6.0/greptime-darwin-arm64-v0.6.0.tar.gz"
    sha256 "4f9a18022ab5cdecba39f0458025ff6415be952ab31c7726c42586128ca35e20"
  end

  def install
    bin.install "greptime"
  end
end

