class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.2/greptime-darwin-amd64-v0.9.2.tar.gz"
    sha256 "fec992d36bff7e7271d9d4a5d4e43114e62c6e607f1c6db4192b3da8726d4840"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.2/greptime-darwin-arm64-v0.9.2.tar.gz"
    sha256 "8251c5e0689adfa4889b7ead7c2721f8e4cd0546f9681e8b6575153b58f1f1be"
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
