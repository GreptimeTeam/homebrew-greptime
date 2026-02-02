class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-rc.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.1/greptime-darwin-amd64-v1.0.0-rc.1.tar.gz"
    sha256 "6e1171347ef4cf6765a4955b6c03894cf056f80953a0c88187840af97a4764ac"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.1/greptime-darwin-arm64-v1.0.0-rc.1.tar.gz"
    sha256 "70957256538891c66d0bfaeff84ba9c36b1e00423df959de00d1d19dc18679db"
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
