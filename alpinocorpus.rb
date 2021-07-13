class Alpinocorpus < Formula
  desc 'Command-line utilities for Alpino treebanks'
  homepage 'http://github.com/rug-compling/alpinocorpus'
  url 'https://github.com/rug-compling/alpinocorpus/archive/0a0c077.tar.gz'
  sha256 'b25d26c20b7a0054e625e0ec96b5ee98fc18117eaaf66ffc9b31068344eba5ad'
  head 'https://github.com/rug-compling/alpinocorpus.git'

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "patched-dbxml"

  def install
    mkdir 'build' do
      ENV["BOOST_ROOT"] = Formula["boost"].opt_prefix

      system "meson", *std_meson_args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end
end
