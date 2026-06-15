class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v1.1.0"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.0/greptime-darwin-amd64-v1.1.0.tar.gz"
    sha256 "c4459d6f4c2c2d4420d0da8e0edb0589326f6e1a2cb876fbf3a2612c4c4c6ee7"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v1.1.0/greptime-darwin-arm64-v1.1.0.tar.gz"
    sha256 "35f5c4c7e23a9cbfb48c71a49d0fd4c54fbb06ca9f89326a4eabbf5c47b5b481"
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
