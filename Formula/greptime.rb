class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-rc.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.2/greptime-darwin-amd64-v1.0.0-rc.2.tar.gz"
    sha256 "7348830bd9730125ee1fb778e9a3801b3e806eb3a860eb64c74b83285173d1ae"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.2/greptime-darwin-arm64-v1.0.0-rc.2.tar.gz"
    sha256 "58ae9f034cd419e52e3d0895d15fc2fd98046a35ffee51e6508a828b34ad0176"
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
