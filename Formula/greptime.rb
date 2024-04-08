class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.7.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.2/greptime-darwin-amd64-v0.7.2.tar.gz"
    sha256 "b196b537f87fdddd0c737155e7065211c5a06c2621fa591a959c75717d3617d9"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.7.2/greptime-darwin-arm64-v0.7.2.tar.gz"
    sha256 "7ba985431292c5bc5b91e6cbd8ee3f420ea41c465f77884f1192ff56731ad350"
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
