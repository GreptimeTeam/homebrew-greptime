class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.11.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.2/greptime-darwin-amd64-v0.11.2.tar.gz"
    sha256 "6b7327013086de4c5535ebf55bb7276a2814ca3bb7704f0cf741bb51f5c800e6"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.2/greptime-darwin-arm64-v0.11.2.tar.gz"
    sha256 "bda5b840bf7e8565435792e77c1edc4d9aaa0e64fae17c984a81b0226201306b"
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
