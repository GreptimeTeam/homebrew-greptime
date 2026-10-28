class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.3.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.0/greptime-darwin-amd64-v1.3.0.tar.gz"
    sha256 "cc192e891bec2fb786c29fed4c9a56c636e87a584b4b7c30b831d69fe7b4d881"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.0/greptime-darwin-arm64-v1.3.0.tar.gz"
    sha256 "86f9e9b1f261262f5b29b5d91c8016a04660f2bdc55b9df186a8148f44506d80"
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
