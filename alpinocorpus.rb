require 'formula'

class Alpinocorpus < Formula
	url 'https://github.com/rug-compling/alpinocorpus/archive/2.0.3.tar.gz'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha1 '095df854d9c706919d7d0e7c4ac5bab0ffff5db3'

	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'dbxml'

	def install
		cmake_args = std_cmake_args
		cmake_args << '-DUSE_REMOTE_CORPUS:BOOL=OFF'

		mkdir 'build' do
			system 'cmake', '..', *cmake_args
			system 'make install'
		end
	end
end
