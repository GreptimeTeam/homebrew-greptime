class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.2/greptime-darwin-amd64-v0.15.2.tar.gz"
    sha256 "7f961617495def1fd8c819c58a60d8f584caecac5268a289b076d5e96ac2f528"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.2/greptime-darwin-arm64-v0.15.2.tar.gz"
    sha256 "0812bc129aa74cec9113534e8a725e0b10b7ef3ed9d66e30d76678587896efc0"
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
