class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.14.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.0/greptime-darwin-amd64-v0.14.0.tar.gz"
    sha256 "2095c0907af38b21a20a93029d4e8fe2dd303cd5163bd5573a6724e9ee442ad1"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.0/greptime-darwin-arm64-v0.14.0.tar.gz"
    sha256 "440e553d6602db4a2a371a751aadfdb196e8386780319a78060acdaade2528b1"
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
