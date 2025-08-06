class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.16.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.16.0/greptime-darwin-amd64-v0.16.0.tar.gz"
    sha256 "e4679a26240753840e72476d8bba445979be9b4c9a0cf31439f0b678dd982a83"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.16.0/greptime-darwin-arm64-v0.16.0.tar.gz"
    sha256 "6b7f763c9a08f60241b0b6b077025fce35d64d0e93cab40f897ea43ffc904415"
  end

  def install
    bin.install "greptime"
  end

  service do
    run [opt_bin/"greptime", "standalone", "start"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/greptimedb/greptime_output.log"
    error_log_path var/"log/greptimedb/greptime_output.log"
  end
end
