class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.17.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.2/greptime-darwin-amd64-v0.17.2.tar.gz"
    sha256 "f58fc1c1543bf15dc9339fe0de47d5773cab7305d743bce2a44827ffe87a6456"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.2/greptime-darwin-arm64-v0.17.2.tar.gz"
    sha256 "52563ebe387fb8c857641ecf461259dfef5edb75ee12b0979582ebfb51d6f523"
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
