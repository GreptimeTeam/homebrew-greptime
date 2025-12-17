class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-beta.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.3/greptime-darwin-amd64-v1.0.0-beta.3.tar.gz"
    sha256 "29080ccd1f5dc7a7a81c113e378b53030faa56d1ed6c100a597fa02c0e72facc"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.3/greptime-darwin-arm64-v1.0.0-beta.3.tar.gz"
    sha256 "ba05009ad933f62b10b7ac6d916b061c37fb059dd9fa83adcda06b860e40337c"
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
