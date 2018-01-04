require 'formula'

class Dact < Formula
  url 'https://github.com/rug-compling/dact/archive/v2.6.0.tar.gz'
  homepage 'http://github.com/rug-compling/dact'
  head 'https://github.com/rug-compling/dact.git'
  sha256 '10b7fe9a9f960f4569c95cc93eab588675fc4f240a35d7cc511b8e4df3f87ec5'
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
