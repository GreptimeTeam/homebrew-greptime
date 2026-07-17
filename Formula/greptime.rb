class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.1.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.3/greptime-darwin-amd64-v1.1.3.tar.gz"
    sha256 "34fedcf081b669ce6144cb39a29078235977ca54e6dbd9ad4f71bbefc7a73288"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.3/greptime-darwin-arm64-v1.1.3.tar.gz"
    sha256 "8df88eae463b2243e370ef8a99535e23d5d89ea8b899e9a14ee5ca6a14324329"
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
