class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v0.0.6.tar.gz"
  sha256 "da17b5101fd08cbaaae0936e7396ed76e4970bcce0485ef2ea5e5195d0e1f43e"
  
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
