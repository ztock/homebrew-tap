class Ztock < Formula
  desc "Command-line for displaying real-time stock data."
  homepage "https://github.com/ztock/ztock"
  url "https://github.com/ztock/ztock/archive/v1.0.0.tar.gz"
  sha256 "d34566fa5e840c363ac8b1a2058b2213fcecbcef3c84fdfec625a39405d3da4a"
  license "MIT"

  bottle :unneeded

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    path = buildpath/"src/github.com/ztock/ztock"
    system "go", "get", "-u", "github.com/ztock/ztock"
    cd path do
      system "go", "build", "-o", "#{bin}/ztock"
    end
  end

  test do
    system bin/"ztock", "--version"
  end
end

