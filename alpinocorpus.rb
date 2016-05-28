require 'formula'

class Alpinocorpus < Formula
	url 'https://github.com/rug-compling/alpinocorpus/archive/2.4.1.tar.gz'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha256 'a6ae9611ceed304ee886e348ebaae7189d210a602d7b26e24bedd5c503469846'

	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'legacy-dbxml'

	def install
		cmake_args = std_cmake_args
		cmake_args << '-DUSE_REMOTE_CORPUS:BOOL=OFF'

		mkdir 'build' do
			system 'cmake', '..', *cmake_args
			system 'make install'
		end
	end
end
