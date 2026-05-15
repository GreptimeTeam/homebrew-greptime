class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.2/greptime-darwin-amd64-v1.0.2.tar.gz"
    sha256 "e6567f5d97fd34b876b5653c22877c238a1633ecbe26b3b7c22b95892656c39c"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.2/greptime-darwin-arm64-v1.0.2.tar.gz"
    sha256 "ba460857f96c90889a23633e792fafda7f33979e44ce5e82822cd56653b6008c"
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
