class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.1.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.1/greptime-darwin-amd64-v1.1.1.tar.gz"
    sha256 "3b3b9ac71a59e7e17d7917aa0862e53bd8386f34bdbd69cb5e1e02c882b11c17"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.1/greptime-darwin-arm64-v1.1.1.tar.gz"
    sha256 "fdfb0886e3a661a599f6dd9f4b58f805efd9c58ff38d27e6d2631ebd20710f39"
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
