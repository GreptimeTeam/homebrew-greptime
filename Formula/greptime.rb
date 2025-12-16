class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.0.0-beta.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.3/greptime-darwin-amd64-v1.0.0-beta.3.tar.gz"
    sha256 "c901a380134c70bd74425f3febe8d4a18a54e471a39891f571afc25cda2d5ebc"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.0.0-beta.3/greptime-darwin-arm64-v1.0.0-beta.3.tar.gz"
    sha256 "7fcbe50cd37966e9dabce08e5ab011b043324f534a07ff76cc2bfeeb4cc76991"
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
