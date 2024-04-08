class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.7.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.2/greptime-darwin-amd64-v0.7.2.tar.gz"
    sha256 "a535e519700cfa547620b6ef99aeaebd91f863d4ba6dd73ebfb36a79133133b8"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.2/greptime-darwin-arm64-v0.7.2.tar.gz"
    sha256 "d34c813ea3204d97b58ed973faa786f7c42df510291c7a17705e70182efe79e7"
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
