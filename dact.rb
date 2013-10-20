require 'formula'

class Dact < Formula
	url 'https://github.com/rug-compling/dact/archive/2.0.5.tar.gz'
	homepage 'http://github.com/rug-compling/dact'
	head 'https://github.com/rug-compling/dact.git'
	sha1 'ae37a04b7ca48ed8c69a5b070142d6cca46c02f5'

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
