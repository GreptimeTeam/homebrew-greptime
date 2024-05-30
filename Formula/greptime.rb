class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.8.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.1/greptime-darwin-amd64-v0.8.1.tar.gz"
    sha256 "e2b017d4ad6deab0fc411c32a57e27d3b3874d45d57c69e20b1af37a94274ec9"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.1/greptime-darwin-arm64-v0.8.1.tar.gz"
    sha256 "0713f0a8aa9e6181f68f9191cdcc64c7bfc84be83db1c641e78d69c7dbee5e31"
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
