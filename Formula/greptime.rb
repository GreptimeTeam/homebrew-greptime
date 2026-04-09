class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0/greptime-darwin-amd64-v1.0.0.tar.gz"
    sha256 "6c29f3446cc856ba683cb507cc35de598991a9fa4d49af218ac5211cf089edf2"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0/greptime-darwin-arm64-v1.0.0.tar.gz"
    sha256 "d39b510426ca89aea80c18e7ce4bf47ec3325b3cfe2f42cc68d5e8ee6badbb41"
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
