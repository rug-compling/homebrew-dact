require 'formula'

class Dact < Formula
	url 'https://github.com/rug-compling/dact/archive/2.2.0.tar.gz'
	homepage 'http://github.com/rug-compling/dact'
	head 'https://github.com/rug-compling/dact.git'
	sha1 'a636d257ccf49acca52d9e77ca0fec08b2949898'

	depends_on 'cmake' => :build
	depends_on 'rug-compling/dact/alpinocorpus'
	depends_on 'qt'

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
