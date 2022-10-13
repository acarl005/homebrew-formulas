class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v0.2.2.tar.gz"
  sha256 "83b893ac70ae9be6fd72e81e68ce2a5a2e2909663aab1f714301345a7142a014"
  
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
