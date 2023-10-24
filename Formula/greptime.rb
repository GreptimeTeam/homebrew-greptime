class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.4.2"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.2/greptime-darwin-amd64-v0.4.2.tar.gz"
    sha256 "07b9356e8380be289a445e8305b3c1bc2d1fb7b393edc21224d8f99da9f3a32b"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.2/greptime-darwin-arm64-v0.4.2.tar.gz"
    sha256 "e3585d3b5ad95324cbac6da38e73db561dd783e2f7d5cea2b1d4bbadd5e4b8cc"
  end

  def install
    bin.install "greptime"
  end
end

