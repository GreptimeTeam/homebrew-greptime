class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-rc.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.1/greptime-darwin-amd64-v1.0.0-rc.1.tar.gz"
    sha256 "9e560f158d45bcf479c146c0149041cc8277d629bfe1607b9a41355a8840251a"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-rc.1/greptime-darwin-arm64-v1.0.0-rc.1.tar.gz"
    sha256 "f75092912e6d3dd70217eef157d5fecdeba1cf3dceec9a748c052646f7e8919a"
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
