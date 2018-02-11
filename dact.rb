require 'formula'

class Dact < Formula
  url 'https://github.com/rug-compling/dact/archive/2.6.2.tar.gz'
  homepage 'http://github.com/rug-compling/dact'
  head 'https://github.com/rug-compling/dact.git'
  sha256 '0b20d8e2945b0715c9f9af0af99ad910de6730bf0097e1681cdd2cda0d7b8068'
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
