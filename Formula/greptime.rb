class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.5"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.5/greptime-darwin-amd64-v0.15.5.tar.gz"
    sha256 "5e5c124ee87821ec57e0ccf6e5536b5df2d3e6724823ef044c912afdb13e368f"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.5/greptime-darwin-arm64-v0.15.5.tar.gz"
    sha256 "579e9171b18aacd52245863208478037a81189b12b9e64a36c43a0377aac63d8"
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
