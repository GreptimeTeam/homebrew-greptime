class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.8.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.2/greptime-darwin-amd64-v0.8.2.tar.gz"
    sha256 "471db1445552939263e16c80d0ab2dab1b43b12fc8ab17834f72248a164f7108"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.8.2/greptime-darwin-arm64-v0.8.2.tar.gz"
    sha256 "f01fa72f271cd427c8d954ea82e131efe5915ec981e051060d01dfd4f3238eda"
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
