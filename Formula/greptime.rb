class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.0/greptime-darwin-amd64-v0.9.0.tar.gz"
    sha256 "360a88c2b90a84d25354c68d38bd38ecc6a6d1be897962e7a5d3e473933b81e2"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.0/greptime-darwin-arm64-v0.9.0.tar.gz"
    sha256 "e951e9863aab646c9397ce684368af764dcff139407a0a52e9cf58466571999e"
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
