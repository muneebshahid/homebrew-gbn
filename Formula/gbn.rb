class Gbn < Formula
  desc "Interactive Git branch and commit navigator with rich previews"
  homepage "https://github.com/muneebshahid/gbn"
  url "https://github.com/muneebshahid/gbn/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "e3c69677a99443ccdcd041adcecdfc4a734df99aec1058ab79439e4324e1819d"
  license "MIT"
  head "https://github.com/muneebshahid/gbn.git", branch: "main"

  depends_on "git"
  depends_on "fzf" => :recommended

  def install
    bin.install "gbn"
  end

  test do
    system "git", "init"
    system "git", "config", "user.email", "test@example.com"
    system "git", "config", "user.name", "Test User"
    system "git", "commit", "--allow-empty", "-m", "Initial commit"
    system "git", "checkout", "-b", "test-branch"
    system "git", "commit", "--allow-empty", "-m", "Test commit"

    assert_match "Usage:", shell_output("#{bin}/gbn --help")
  end
end
