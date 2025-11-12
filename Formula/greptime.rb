class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-beta.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.1/greptime-darwin-amd64-v1.0.0-beta.1.tar.gz"
    sha256 "8c1047f6711c2b270f4d5cadab0ffcfe81ba5e2baf1107aab62e591eb7b8d2b4"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.1/greptime-darwin-arm64-v1.0.0-beta.1.tar.gz"
    sha256 "0f490cb1cdeb8d397a4aaea502e5a40ddc144d4ff570186de9c5b6755e8388cc"
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
