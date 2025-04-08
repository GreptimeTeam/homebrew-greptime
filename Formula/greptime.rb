class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.13.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.2/greptime-darwin-amd64-v0.13.2.tar.gz"
    sha256 "21c3b271a81946fd4e7a83f6d10a9ab570db5f5d2bb4b8b3bb71fa0e12fa8cfc"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.2/greptime-darwin-arm64-v0.13.2.tar.gz"
    sha256 "9d8c5c989024736105170cc588f42ddf96c87a569f797a72d577832b1ac362bc"
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
