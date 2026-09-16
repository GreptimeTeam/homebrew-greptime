class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.2.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.1/greptime-darwin-amd64-v1.2.1.tar.gz"
    sha256 "2911f9f7cfcfa47e405db82e96358d7238b2fe924cff2b971413dc7097eb0c8a"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.1/greptime-darwin-arm64-v1.2.1.tar.gz"
    sha256 "1b76a689541cbb0f30760d217bf27f17d467178db57c101aa873f874382baa81"
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
