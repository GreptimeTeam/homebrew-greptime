class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.1.4"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.4/greptime-darwin-amd64-v1.1.4.tar.gz"
    sha256 "7ffa1fef0b8faeff315399b5468f290fcb6709048a0945622f83dcdf483a117a"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.4/greptime-darwin-arm64-v1.1.4.tar.gz"
    sha256 "c900accb0f7a211e83929bb44e8f830feaf33956f7ec4cc4056ac63e6a82d413"
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
