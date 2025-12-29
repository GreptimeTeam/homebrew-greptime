class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-beta.4"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.4/greptime-darwin-amd64-v1.0.0-beta.4.tar.gz"
    sha256 "eb0a3100438d7003d067be4189a6f7781511d0a09c430bf591486ec0798ef5a9"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.4/greptime-darwin-arm64-v1.0.0-beta.4.tar.gz"
    sha256 "34fa5a72f918d5949398504667a8f9cdbc933b65a8599682b7b0bd1dfaf54bce"
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
