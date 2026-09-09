class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.2.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0/greptime-darwin-amd64-v1.2.0.tar.gz"
    sha256 "82486b59e477080f689f924309e47eb297581b55f85a72bf9a3d49a86376e291"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0/greptime-darwin-arm64-v1.2.0.tar.gz"
    sha256 "bad9f3e7bc429b86e52df083ef6fa9de014513cca17aa5e92cbd41293800d072"
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
