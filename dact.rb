require 'formula'

class Dact < Formula
  url 'https://github.com/rug-compling/dact/archive/2.4.4.tar.gz'
  homepage 'http://github.com/rug-compling/dact'
  head 'https://github.com/rug-compling/dact.git'
  sha256 '7a1ecaa0622d759c317d7236ec7ef9e13224b39def7cd58d1a29a3ae06ab328b'
  revision 1

  depends_on 'cmake' => :build
  depends_on 'rug-compling/dact/alpinocorpus'
  depends_on 'qt5'

  def install
    args = std_cmake_args
    args << '-DUSE_REMOTE_CORPUS:BOOL=OFF'
    args << "-DUSE_WEBSERVICE:BOOL=OFF"
    args << "-DENABLE_BUNDLE:BOOL=OFF"

    mkdir 'build'
    cd 'build' do
      system 'cmake', '..', *args
      system 'make install'
    end
  end
end
