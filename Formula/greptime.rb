class Greptime < Formula
  desc "An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported."
  homepage "https://github.com/GreptimeTeam/greptimedb"
  version "v0.14.3"
  license "Apache-2.0"

  if Hardware::CPU.intel?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.3/greptime-darwin-amd64-v0.14.3.tar.gz"
    sha256 "3f1e6efb61e8f57c9b4f44379e4775f42691f1429880a972898f8f5db54cefdb"
  elsif Hardware::CPU.arm?
    url "https://github.com/GreptimeTeam/greptimedb/releases/download/v0.14.3/greptime-darwin-arm64-v0.14.3.tar.gz"
    sha256 "f809201bc827de444012a78d38c4388d7e5a406a0ab376aefdd249ed2989821c"
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
