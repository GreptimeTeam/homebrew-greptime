class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.9.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.3/greptime-darwin-amd64-v0.9.3.tar.gz"
    sha256 "ef2d151624f4c56906468197e5130a8050b7442b72b32925d8968969de84a5db"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.9.3/greptime-darwin-arm64-v0.9.3.tar.gz"
    sha256 "cee1f3bb1c61b965dc5ce9c72622f6b2aea78c3e4a84d693ad1b036819f8d61e"
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
