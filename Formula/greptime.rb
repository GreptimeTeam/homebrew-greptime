class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.14.2"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.2/greptime-darwin-amd64-v0.14.2.tar.gz"
    sha256 "745dc7e2f0bb49bef8c23c261d0a82b1e8c9ef2306f3daad304aab3e605eca93"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.2/greptime-darwin-arm64-v0.14.2.tar.gz"
    sha256 "3e2abdccf826f906f70c27387be0989f775c85ad5428e78c0e080502a4caa788"
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
