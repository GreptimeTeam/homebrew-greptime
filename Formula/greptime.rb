class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.2.0-beta.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0-beta.1/greptime-darwin-amd64-v1.2.0-beta.1.tar.gz"
    sha256 "30acb50cedf8b627e42650446fffa1fe4829067af46ccb1c71d693b4167b1e5b"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0-beta.1/greptime-darwin-arm64-v1.2.0-beta.1.tar.gz"
    sha256 "aac25bf8e4f227e552b86137b0f933128bffa45f4fd4e4046a812f1d343b2e87"
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
