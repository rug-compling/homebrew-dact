require 'formula'

class Alpinocorpus < Formula
	depends_on 'cmake' => :build
	depends_on 'boost'
	depends_on 'dbxml'

	url 'https://github.com/rug-compling/alpinocorpus/tarball/1.4.1'
	homepage 'http://github.com/rug-compling/alpinocorpus'
	head 'https://github.com/rug-compling/alpinocorpus.git'
	sha1 '54fd87cd2c4caeb77dea8273cb27740a8f82e7bc'

	def install
		args = std_cmake_args
		args << '-DUSE_REMOTE_CORPUS:BOOL=OFF'

		mkdir 'build'
		cd 'build' do
			system 'cmake', '..', *args
			system 'make install'
		end
	end
end
