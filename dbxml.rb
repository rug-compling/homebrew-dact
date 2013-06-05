require 'formula'

class Dbxml < Formula
  url 'http://download.oracle.com/berkeley-db/dbxml-2.5.16.tar.gz'
  homepage 'http://www.oracle.com/us/products/database/berkeley-db/index-066571.html'
  md5 '2732618d5c4f642fba3d2a564a025986'

  def patches
  	{ :p1 => ["https://raw.github.com/gist/3761290/365a3c2077191530216faaf97ecbadaacb9efc2f/fix-gcc-4.7-build.patch", "https://raw.github.com/gist/3986724/f27306c03f42a85a43fc667d5c57a69ec70a2920/UnionQP-segfault.diff", "https://gist.github.com/danieldk/5700533/raw/883b623a91b2ace2ddc69c1b8a13792acc283640/gistfile1.txt"]}
  end

  def install
	# Parallel builds sometimes fail.
	ENV.deparallelize
	system "./buildall.sh", "--prefix=#{prefix}"
  end
end
