class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.11.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.0/greptime-darwin-amd64-v0.11.0.tar.gz"
    sha256 "8ce75de502d6e35beace88c549a84f9073270c386a8cfef5baf884147286d802"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.0/greptime-darwin-arm64-v0.11.0.tar.gz"
    sha256 "c6bcac34d6fadef88356bd9d0e46d5a54d3617413c356796251faf7c28aa65e1"
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
