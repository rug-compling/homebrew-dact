require 'formula'

class Dact < Formula
  url 'https://github.com/rug-compling/dact/archive/e38f503.tar.gz'
  homepage 'http://github.com/rug-compling/dact'
  head 'https://github.com/rug-compling/dact.git'
  sha256 '3a0cc8230312d191a6c2c7562e8d683f9d27e28e07f948c0309a8f386b38d308'
  revision 1

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on 'rug-compling/dact/alpinocorpus'
  depends_on 'qt5'

  def install
    mkdir 'build'
    cd 'build' do
      system "meson", *std_meson_args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end
end
