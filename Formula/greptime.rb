class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.4"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.4/greptime-darwin-amd64-v0.9.4.tar.gz"
    sha256 "d1c48df56c9f9f886f643d794252b9827318fd6368a6141ae102fa4863225d69"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.4/greptime-darwin-arm64-v0.9.4.tar.gz"
    sha256 "2b901773631d65f2d2de5bd8c9898160fc5eefddeef27bb595a8abd3cad2b8bc"
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
