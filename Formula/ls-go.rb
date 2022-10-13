class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v0.2.3.tar.gz"
  sha256 "27f2bbb9cc4a9ceb0bbbb33e6e253d617c80114ef29950c8e2e1f6663edc01f0"
  
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
