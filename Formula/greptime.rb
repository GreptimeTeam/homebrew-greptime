class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.12.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.1/greptime-darwin-amd64-v0.12.1.tar.gz"
    sha256 "26573c330af36542c29ff5e7600bc137ed50d8e67269aabaf86b8142b46011c8"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.12.1/greptime-darwin-arm64-v0.12.1.tar.gz"
    sha256 "540c30e93a04578a09d98f10278f145a37c1f5e3294d865e2d28a9d0492460b0"
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
