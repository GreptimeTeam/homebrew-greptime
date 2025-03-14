class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.13.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.0/greptime-darwin-amd64-v0.13.0.tar.gz"
    sha256 "015ffb3dac123b5178b19c832376a84f6a3a62836de28a8827f953d5c59dbfb8"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.0/greptime-darwin-arm64-v0.13.0.tar.gz"
    sha256 "322dc1e94ea0d54df78a4812df5ba1166691a23c3b54cb386e43870853079ac3"
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
