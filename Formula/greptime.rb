class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.1/greptime-darwin-amd64-v1.0.1.tar.gz"
    sha256 "648ae9dbcf54818a984b450f77f996ce3c326a7be6d221af87312b41a2a7a21c"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.1/greptime-darwin-arm64-v1.0.1.tar.gz"
    sha256 "b1a6c8c1af875edb41000985d2c7fb2201e9d266e02e565aa8108402b35cc695"
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
