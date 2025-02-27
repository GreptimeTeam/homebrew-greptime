class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.12.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.0/greptime-darwin-amd64-v0.12.0.tar.gz"
    sha256 "937db39a40f45273907be8248ee3abeb3bce429c137e395ec6064fee6bbd92c5"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.0/greptime-darwin-arm64-v0.12.0.tar.gz"
    sha256 "c556663bc3399397386a71f73a3846a1bea2b9717d5a24c65a9d8da35cd6e4c4"
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
