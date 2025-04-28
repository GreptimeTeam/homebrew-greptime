class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.14.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.1/greptime-darwin-amd64-v0.14.1.tar.gz"
    sha256 "6dc0a8d463b2612d147e772add94022a4ce066e7b27d9a5f9f029980433ad2ec"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.1/greptime-darwin-arm64-v0.14.1.tar.gz"
    sha256 "89a8516f9fffe5a6242e9061ad4538e69e6b2d0687d78be6d8b58a075af1621c"
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
