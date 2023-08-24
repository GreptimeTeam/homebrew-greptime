class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.4.0-nightly-20230814"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.0-nightly-20230814/greptime-darwin-amd64-v0.4.0-nightly-20230814.tar.gz"
    sha256 "ceb2d7c2903ce37bc2bfae2fc41025684655c1bf4b7bb378036a994b71a1d7cf"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.4.0-nightly-20230814/greptime-darwin-arm64-v0.4.0-nightly-20230814.tar.gz"
    sha256 "bbd8e6efcc8b80a8c51cb70bf2c3146f49e3a481282b97f7da657b1368c12ba1"
  end

  def install
    bin.install "greptime"
  end
end
