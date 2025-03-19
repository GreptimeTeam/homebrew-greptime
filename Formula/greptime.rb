class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.13.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.1/greptime-darwin-amd64-v0.13.1.tar.gz"
    sha256 "b2ca46de79f2ff977af7928e44d5cfb40ed9daaaef7a7991d226e7769a9ea761"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.13.1/greptime-darwin-arm64-v0.13.1.tar.gz"
    sha256 "5bdc7bbfe2fcb1a18fffb06f9a0976fd09678137cbdd85fa3c8b25cb386567dc"
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
