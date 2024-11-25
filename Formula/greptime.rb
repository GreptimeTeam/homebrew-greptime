class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.10.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.1/greptime-darwin-amd64-v0.10.1.tar.gz"
    sha256 "415a5a5fbb8a06f279789c3a69e17a95f0a9a65e1a27ed8c106f2249b17c38e0"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.1/greptime-darwin-arm64-v0.10.1.tar.gz"
    sha256 "1f7d91581d49f0d89273e8183fc728108ca6138c0ab6957f5ce4e1cb939a98b8"
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
