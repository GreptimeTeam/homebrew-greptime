class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.2.0-beta.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0-beta.2/greptime-darwin-amd64-v1.2.0-beta.2.tar.gz"
    sha256 "8ae426630330bebdcc4f067c193bc280de8c89a05cd4b526c80148b7c6f291dd"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.2.0-beta.2/greptime-darwin-arm64-v1.2.0-beta.2.tar.gz"
    sha256 "de2177b4f540a4c1e71cfba1c8e7e9fb1d0c0d7f3f783efe0da13c7d53916442"
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
