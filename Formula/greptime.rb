class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-beta.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.2/greptime-darwin-amd64-v1.0.0-beta.2.tar.gz"
    sha256 "49aeaa1b5fbdbcf32f843022bd5a3d41e9f91e19db4f78a3a0d611cbd6cb29f7"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.2/greptime-darwin-arm64-v1.0.0-beta.2.tar.gz"
    sha256 "8b96b0f5be7e44a5057c81df6259046d3f15d7e0c2a6d3dba9e952baaf4031f5"
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
