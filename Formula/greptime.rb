class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.12.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.2/greptime-darwin-amd64-v0.12.2.tar.gz"
    sha256 "f531017c5d9b626957e6d8cbbf7df7d2da96ad1532ec90c6748dcddfbaf1179a"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.2/greptime-darwin-arm64-v0.12.2.tar.gz"
    sha256 "c9d2c735061f2daf3513b0102a1812ead0f7404688617549a4e496cc700cca6a"
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
