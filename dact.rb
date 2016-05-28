require 'formula'

class Dact < Formula
	url 'https://github.com/rug-compling/dact/archive/2.4.1.tar.gz'
	homepage 'http://github.com/rug-compling/dact'
	head 'https://github.com/rug-compling/dact.git'
	sha256 '8a32949aa8db8682b4fac0bd6d7fb6676608402a33e791aaa18cfd73102e0934'

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
