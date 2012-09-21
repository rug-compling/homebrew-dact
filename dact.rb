require 'formula'

class Dact < Formula
	depends_on 'cmake' => :build
	depends_on 'alpinocorpus'
	depends_on 'qt'

	url 'https://github.com/rug-compling/dact/tarball/1.6.0'
	homepage 'http://github.com/rug-compling/dact'
	head 'https://github.com/rug-compling/dact.git'
	sha1 '273cf43dc8d1b6aa1fc12f8f9d0e213d01074d24'

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