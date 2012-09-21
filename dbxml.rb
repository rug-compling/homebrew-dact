require 'formula'

class Dbxml < Formula
  url 'http://download.oracle.com/berkeley-db/dbxml-2.5.16.tar.gz'
  homepage 'http://www.oracle.com/us/products/database/berkeley-db/index-066571.html'
  md5 '2732618d5c4f642fba3d2a564a025986'

  def patches
  	{ :p1 => "https://raw.github.com/gist/3761290/365a3c2077191530216faaf97ecbadaacb9efc2f/fix-gcc-4.7-build.patch" }
  end

  def install
	# Parallel builds sometimes fail.
	ENV.deparallelize
	system "./buildall.sh", "--prefix=#{prefix}"
  end
end
