class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.1/greptime-darwin-amd64-v0.9.1.tar.gz"
    sha256 "21f2308a3ed7c7e38d0fcc90a0a550e9a933116794700e6add1c1ee8d653920d"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.1/greptime-darwin-arm64-v0.9.1.tar.gz"
    sha256 "10f19dcb7c0f36bbf8ace0aa47b58b5823add3b6ee24fccd87f7674d927b63bc"
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
