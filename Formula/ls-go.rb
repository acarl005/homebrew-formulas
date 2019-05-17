class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v0.0.11.tar.gz"
  sha256 "62eccd6e379ccb73ff60b0417c07524a67b4807dbd47c5e97b3a45f148d054f0"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"build/src").mkpath
    ln_s buildpath, buildpath/"build/src/github.com"
    system "GOPATH=$PWD/build go get github.com/acarl005/ls-go"
    bin.install "build/bin/ls-go"
  end

  test do
    system bin/"ls-go", "--help"
  end
end
