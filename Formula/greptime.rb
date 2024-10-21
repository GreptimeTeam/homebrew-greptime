class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.5"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.5/greptime-darwin-amd64-v0.9.5.tar.gz"
    sha256 "556b3c63151950ba433566ec25f27cc2bb9df88cbad5c2d95ae76db57b390a61"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.5/greptime-darwin-arm64-v0.9.5.tar.gz"
    sha256 "4fdf5c15a7f848a6a1ff93b8bc445d2626a7222442e10b950b94f7782a31a549"
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
