class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.10.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.2/greptime-darwin-amd64-v0.10.2.tar.gz"
    sha256 "71d38d043ab4824e1b477cd75c0c07f11d3a52ef4256700b528570376e03a365"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.10.2/greptime-darwin-arm64-v0.10.2.tar.gz"
    sha256 "c290435383127904b06991445100704890e243eb6b6ec424be25bfd982fcb100"
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
