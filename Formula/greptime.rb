class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.11.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.3/greptime-darwin-amd64-v0.11.3.tar.gz"
    sha256 "dc2f0f5d20aec4df031f6fb7d47933944d0ca1a87a47cd8afe26a86500910c92"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.3/greptime-darwin-arm64-v0.11.3.tar.gz"
    sha256 "5970036f9aa7754adb2dbc8dd5f668488614bb10d8401c6b8c4f1de3fff89492"
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
