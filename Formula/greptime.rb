class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.14.4"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.4/greptime-darwin-amd64-v0.14.4.tar.gz"
    sha256 "af6fc11b537460d2022498386b1b5d0b974c4fb69b772ae43deea2dcfbc98a0c"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.4/greptime-darwin-arm64-v0.14.4.tar.gz"
    sha256 "8fa3debcfe79a942d97d577eecba6ec50b1c7a101a49054ab8ae603239499457"
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
