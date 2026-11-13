class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.3.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.1/greptime-darwin-amd64-v1.3.1.tar.gz"
    sha256 "4ecc29eea01111f625064e45ca3074f81fc28771d7bd1bed182e12377b7716af"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.1/greptime-darwin-arm64-v1.3.1.tar.gz"
    sha256 "793670100f06f0c395fb01bbc83e83c5f39d28de6f46e1151f2c7f7174772448"
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
