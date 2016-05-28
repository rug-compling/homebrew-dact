require 'formula'

class LegacyDbxml < Formula
  url 'http://download.oracle.com/berkeley-db/dbxml-2.5.16.tar.gz'
  homepage 'http://www.oracle.com/us/products/database/berkeley-db/index-066571.html'
  sha256 'f2423be3805811a9cca71d6877c0b1bdc1941cd76c3f26d6eb011a5724a3edd2'

  def patches
  	{ :p1 => ["https://gist.github.com/danieldk/3761290/raw/365a3c2077191530216faaf97ecbadaacb9efc2f/fix-gcc-4.7-build.patch", "https://gist.github.com/danieldk/3986724/raw/f27306c03f42a85a43fc667d5c57a69ec70a2920/UnionQP-segfault.diff", "https://gist.github.com/danieldk/5700533/raw/883b623a91b2ace2ddc69c1b8a13792acc283640/gistfile1.txt"]}
  end

  def install
	# Parallel builds sometimes fail.
	ENV.deparallelize
	system "./buildall.sh", "--prefix=#{prefix}"
  end
end