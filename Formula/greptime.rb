class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.0/greptime-darwin-amd64-v0.15.0.tar.gz"
    sha256 "5dbede0a9358e0f98e33245f68b87a102074b0ed2614c9c87f42b5435b42aa77"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.0/greptime-darwin-arm64-v0.15.0.tar.gz"
    sha256 "bbfa2166c0a0a990adeef19c09ead0595fa0f5bace4271d03fda1612d5ff34d8"
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
