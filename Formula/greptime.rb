class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.17.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.0/greptime-darwin-amd64-v0.17.0.tar.gz"
    sha256 "d09f07227902ae9924e573d3e20a276d115b7dc1c588afd13fafe3b39c22f53f"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.0/greptime-darwin-arm64-v0.17.0.tar.gz"
    sha256 "a7fa5b48585531ad052d21a1f9c2db15bb41631ed5afebdd7ce4a6a5700218fb"
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
