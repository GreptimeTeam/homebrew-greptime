class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.11.1"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.1/greptime-darwin-amd64-v0.11.1.tar.gz"
    sha256 "d40e321f7a7becfbbfbc6918a1ce224b9eda3be991fff7dcb977170a52a6dfdf"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.11.1/greptime-darwin-arm64-v0.11.1.tar.gz"
    sha256 "5db883f817d8e075bd5702ab1c1cbc550111c7b21c0b463783f10af32981f127"
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
