require 'formula'

class Dact < Formula
	depends_on 'cmake' => :build
	depends_on 'alpinocorpus'
	depends_on 'qt'

	url 'https://github.com/rug-compling/dact/tarball/2.0.3'
	homepage 'http://github.com/rug-compling/dact'
	head 'https://github.com/rug-compling/dact.git'
	sha1 '40ff1bad73d7216b7034f6337c38314ead01446f'

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
