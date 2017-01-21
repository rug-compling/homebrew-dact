require 'formula'

class Alpinocorpus < Formula
	url 'https://github.com/rug-compling/alpinocorpus/archive/2.6.0.tar.gz'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha256 'be9b30c0b3cb13b6a710bc4cc96e526d1a61864c2b48914a2c7e182d43135d9f'

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
