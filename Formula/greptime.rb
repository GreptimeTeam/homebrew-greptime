class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.10.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.0/greptime-darwin-amd64-v0.10.0.tar.gz"
    sha256 "9b4833dc44a6d4944c878796a1b7bb267c223e38fc6a36736465fc818912165e"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.0/greptime-darwin-arm64-v0.10.0.tar.gz"
    sha256 "356f882e027bedce0e179dddaf5abeefa7688f6d425dc5a49da567f79048b0a3"
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
