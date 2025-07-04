class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.1/greptime-darwin-amd64-v0.15.1.tar.gz"
    sha256 "39d7f7b905ad070c7c418cc8e59629765cf573ffb24c321dc52dd28651494635"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.1/greptime-darwin-arm64-v0.15.1.tar.gz"
    sha256 "cea4784a1baf3901497008c85c19d55b05f08ef7d11e5fb8cf351487478b0fc2"
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
