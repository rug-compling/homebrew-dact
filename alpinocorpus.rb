require 'formula'

class Alpinocorpus < Formula
	url 'https://github.com/rug-compling/alpinocorpus/archive/2.2.0.tar.gz'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha1 '20bbf73088aab7cfde0faac1516884406d20bec8'

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
