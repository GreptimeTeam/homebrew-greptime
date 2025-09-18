class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.17.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.1/greptime-darwin-amd64-v0.17.1.tar.gz"
    sha256 "1af427b7a017932c2e488b1c8bdb7893aa48fbb3ceb34985c15b6e2fd0ea7a21"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.17.1/greptime-darwin-arm64-v0.17.1.tar.gz"
    sha256 "d54922a4624be6698ca1c732098bfa263ae3fbf298d26cec46942334c8221c9e"
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
