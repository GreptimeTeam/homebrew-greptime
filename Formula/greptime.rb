class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.15.4"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.4/greptime-darwin-amd64-v0.15.4.tar.gz"
    sha256 "72b6207263bc0a5e9e5644377609f571a2917c72dfa20f59d4ff09df783b5381"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.15.4/greptime-darwin-arm64-v0.15.4.tar.gz"
    sha256 "1cfece3e11f47613e0a2d4d109f780812b937591ccd05e9f86327d709e99af1d"
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
