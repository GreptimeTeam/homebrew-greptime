class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.3/greptime-darwin-amd64-v0.15.3.tar.gz"
    sha256 "74aa606c0239e619d03303a244008dc97135ff9d033e8cae9d466a38574036a1"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.3/greptime-darwin-arm64-v0.15.3.tar.gz"
    sha256 "933f5d3fdf4c070c0a76b571b2e1b3780a486e26f626a82ff70ebb5468400d13"
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
