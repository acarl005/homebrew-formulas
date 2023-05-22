class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v1.0.0.tar.gz"
  sha256 "7b88b4d303c5b16048b258c1a167a54ea257fd4c01a50b2fc858c18ca4e7cadb"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"build/src").mkpath
    ln_s buildpath, buildpath/"build/src/github.com"
    system "GOPATH=$PWD/build go install github.com/acarl005/ls-go@latest"
    bin.install "build/bin/ls-go"
  end

  test do
    system bin/"ls-go", "--help"
  end
end
