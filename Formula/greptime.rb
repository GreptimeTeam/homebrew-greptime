class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.8.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.0/greptime-darwin-amd64-v0.8.0.tar.gz"
    sha256 "fc82d357a1b24037516f1029f59a627e3c086c0e540120b014bdce98c4576b29"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.0/greptime-darwin-arm64-v0.8.0.tar.gz"
    sha256 "d4f0981300361cb2d10e12141504234e3f23ba9d63d91ab4623de2d19f2b28a6"
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
