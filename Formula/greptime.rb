class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.1.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.2/greptime-darwin-amd64-v1.1.2.tar.gz"
    sha256 "61b24f04336599ba0c306f2021ab10651042485ea8928fd7312c6a7d994d4583"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.2/greptime-darwin-arm64-v1.1.2.tar.gz"
    sha256 "a6e6847c04b394c3e52e789008a281065601309f52f8b75644a282738c287be4"
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
