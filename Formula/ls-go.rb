class LsGo < Formula
  desc "A more colorful, user-friendly implementation of `ls` written in Go"
  homepage "https://github.com/acarl005/ls-go"
  url "https://github.com/acarl005/ls-go/archive/v0.0.0.tar.gz"
  sha256 "db9ba7300fbbaf92926b2c95fd63e3e936739e359f123b5a45e6ca04b490af51"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/acarl005").mkpath
    ln_s buildpath, buildpath/"src/github.com/acarl005/ls-go"
    system "go", "get", "./"
    system "go", "build", "-o", bin/"ls-go"
  end

  test do
    system bin/"ls-go", "--help"
  end
end
