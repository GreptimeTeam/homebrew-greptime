class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.3.0-alpha.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.0-alpha.1/greptime-darwin-amd64-v1.3.0-alpha.1.tar.gz"
    sha256 "23057075c41aeabee291e391fff65374200fbe3bfbc4a716e19e6550d76e4cd5"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.3.0-alpha.1/greptime-darwin-arm64-v1.3.0-alpha.1.tar.gz"
    sha256 "168f77e25374469abb109431ce347b7fc2ecdbb1d800c0bd2e02eef1c25cd96d"
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
